//
//  LogsController.swift
//  IteoLogger
//
//  Created by Patryk Średziński on 05/02/2021.
//  Copyright (c) 2021 iteo. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates by Patryk Średziński
//

import UIKit

protocol LogsPresentable: IteoLoggerSpinnerPresentable & IteoLoggerAlertPresentable {
    func resetLogs()
    func appendNewSection(section: LogSectionItem)
}

final class LogsController: IteoLoggerBaseViewController {
    
    @IBOutlet private var closeButton: UIButton!
    @IBOutlet private var refreshButton: UIButton!
    @IBOutlet private var clearButton: UIButton!
    @IBOutlet private var filtersButton: UIButton!
    @IBOutlet private var shareButton: UIButton!
    @IBOutlet private var scrollUpButton: UIButton!
    @IBOutlet private var scrollDownButton: UIButton!
    
    @IBOutlet private var tableView: UITableView!
    @IBOutlet private var loadedSessionsCountLabel: UILabel!
    
    private var expandedIndexPaths = Set<IndexPath>()
    
    private let interactor: LogsInteractor
    private let viewModel: LogsViewModel
    private let shareFormat: String
    private let dateFormatter: DateFormatManager

    init(viewModel: LogsViewModel, interactor: LogsInteractor, shareFormat: String, dateFormatter: DateFormatManager) {
        self.viewModel = viewModel
        self.interactor = interactor
        self.shareFormat = shareFormat
        self.dateFormatter = dateFormatter
        super.init(nibName: nil, bundle: .framework)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        interactor.loadNextSection(id: 0)
    }
    
}

private extension LogsController {
    
    private func setupView() {
        view.backgroundColor = .systemOrange
        setupButtons()
        setupTableView()
    }
    
    private func setupButtons() {
        setupButton(closeButton)
        setupButton(refreshButton)
        setupButton(clearButton)
        setupButton(filtersButton)
        setupButton(shareButton)
        setupButton(scrollUpButton)
        setupButton(scrollDownButton)
    }
    
    private func setupButton(_ button: UIButton) {
        button.backgroundColor = .systemBackground
        button.tintColor = .systemOrange
    }
    
    private func setupTableView() {
        let nibLogCell = UINib(nibName: LogCell.reuseIdentifier, bundle: .framework)
        let nibPauseCell = UINib(nibName: PauseCell.reuseIdentifier, bundle: .framework)
        tableView.register(nibLogCell, forCellReuseIdentifier: LogCell.reuseIdentifier)
        tableView.register(nibPauseCell, forCellReuseIdentifier: PauseCell.reuseIdentifier)
        tableView.register(LogSectionHeader.self, forHeaderFooterViewReuseIdentifier: LogSectionHeader.reuseIdentifier)
        tableView.backgroundColor = .systemBackground
        tableView.sectionIndexColor = .secondaryLabel
        tableView.separatorColor = .tertiarySystemBackground
    }
    
    @IBAction private func closeTapped() {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction private func refreshTapped() {
        interactor.reloadLogs()
    }
    
    @IBAction private func deleteTapped() {
        interactor.deleteLogs()
    }
    
    @IBAction private func filtersTapped() {
        interactor.displayFilters()
    }
    
    @IBAction private func shareTapped() {
        interactor.shareLogs(sessions: viewModel.dataSource)
    }
    
    @IBAction private func previousTapped() {
        let visibleIndexes = tableView.indexPathsForVisibleRows ?? []
        guard var minimumVisibleSection = visibleIndexes.map({ $0.section }).min() else { return }
        let minimumRowIndex = 0
        if visibleIndexes.contains(where: { $0.row == minimumRowIndex && $0.section == minimumVisibleSection }) {
            minimumVisibleSection -= 1
        }
        let sectionToScrollTo = max(0, minimumVisibleSection)
        let rowToScrollTo = 0
        tableView.scrollToRow(at: IndexPath(row: rowToScrollTo, section: sectionToScrollTo), at: .top, animated: true)
    }
    
    @IBAction private func nextTapped() {
        let visibleIndexes = tableView.indexPathsForVisibleRows ?? []
        guard var maximumVisibleSection = visibleIndexes.map({ $0.section }).max() else { return }
        let maximumRowIndex = tableView.numberOfRows(inSection: maximumVisibleSection) - 1
        if visibleIndexes.contains(where: { $0.row == maximumRowIndex && $0.section == maximumVisibleSection }) {
            maximumVisibleSection += 1
        }
        let sectionToScrollTo = min(tableView.numberOfSections - 1, maximumVisibleSection)
        let rowToScrollTo = tableView.numberOfRows(inSection: sectionToScrollTo) - 1
        tableView.scrollToRow(at: IndexPath(row: rowToScrollTo, section: sectionToScrollTo), at: .bottom, animated: true)
    }
    
    private func logLongPressed(_ log: IteoLoggerItem) {
        interactor.copyLog()
        UIPasteboard.general.string = log.toString(shareFormat, dateFormatter: dateFormatter)
    }
    
    private func updateLoadedSessionsText() {
        guard let firstSession = viewModel.dataSource.first,
              let lastSession = viewModel.dataSource.last else {
            loadedSessionsCountLabel.text = "No logs available"
            return
        }
        loadedSessionsCountLabel.text = "Loaded \(viewModel.dataSource.count) out of \(firstSession.index) available sessions, since: \(lastSession.date)"
    }
    
}

extension LogsController: LogsPresentable {
    
    func resetLogs() {
        viewModel.dataSource = []
        tableView.reloadData()
        updateLoadedSessionsText()
    }
    
    func appendNewSection(section: LogSectionItem) {
        viewModel.dataSource.append(section)
        tableView.insertSections(IndexSet(integer: viewModel.dataSource.count - 1), with: .bottom)
        updateLoadedSessionsText()
    }

}

extension LogsController: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel.dataSource.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let section = viewModel.dataSource[section]
        return section.items.count
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let sectionItem = viewModel.dataSource[section]
        guard let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: LogSectionHeader.reuseIdentifier) as? LogSectionHeader else {
            return nil
        }
        header.setup(with: "SESSION #\(sectionItem.index)", date: sectionItem.date)
        return header
    }
    
    func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
        return ""
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let section = viewModel.dataSource[indexPath.section]
        let cellItem = section.items[indexPath.row]
        switch cellItem {
        case .log(let logItem):
            guard let cell = tableView.dequeueReusableCell(withIdentifier: LogCell.reuseIdentifier, for: indexPath) as? LogCell else {
                return UITableViewCell()
            }
            cell.setup(with: logItem,
                       longTapAction: { [weak self] in
                        guard let self = self else { return }
                        self.logLongPressed(logItem)
                       },
                       isExpanded: expandedIndexPaths.contains(indexPath))
            return cell
        case .pause(let length):
            guard let cell = tableView.dequeueReusableCell(withIdentifier: PauseCell.reuseIdentifier, for: indexPath) as? PauseCell else {
                return UITableViewCell()
            }
            cell.setup(with: length)
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, willDisplayFooterView view: UIView, forSection section: Int) {
        let isLastSection = section == viewModel.dataSource.count - 1
        if isLastSection {
            interactor.loadNextSection(id: section + 1)
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if expandedIndexPaths.contains(indexPath) {
            expandedIndexPaths.remove(indexPath)
        } else {
            expandedIndexPaths.insert(indexPath)
        }
        tableView.reloadRows(at: [indexPath], with: .fade)
    }
}
