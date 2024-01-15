import UIKit
import WebKit

class WebView: UIViewController {
    private let webView: WKWebView = {
        let prefrences = WKWebpagePreferences()
        prefrences.allowsContentJavaScript =  true
        let configuration = WKWebViewConfiguration()
        configuration.defaultWebpagePreferences = prefrences
        let webView =  WKWebView(frame: .zero, configuration: configuration)
        return webView
    }()
    
    private let url: URL
    
    init(url: URL){
        self.url = url
        // self.title = title
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        view.addSubview(webView)
        webView.load(URLRequest(url: url))
        configureButton()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        webView.frame = view.bounds
    }
    @objc private func configureButton() {
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(didTapDone))
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .refresh, target: self, action: #selector(didTapRefesh) )
    }
    @objc private func didTapDone() {
        dismiss(animated: true, completion: nil)
    }
    @objc private func didTapRefesh() {
        webView.load(URLRequest(url: url))
    }
}
