import UIKit

class SecondViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
 var db = FakeDatabase.shared
    var touristActivityList:[TouristActivity] = []
    @IBOutlet weak var CollectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()

        CollectionView.dataSource = self
        CollectionView.delegate = self
        self.touristActivityList = db.getAll()
    }
   
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return touristActivityList.count
    }
        func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = CollectionView.dequeueReusableCell(withReuseIdentifier: "TouristCollectionViewCell", for: indexPath) as! TouristActivityCollectionViewCell
        cell.setup(with: touristActivityList[indexPath.row])
        return cell
    }
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: 200, height: 300)
    }
     func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath)  {
                  let touristActivity = self.touristActivityList[indexPath.row]
         let mainStoryBoard = UIStoryboard(name: "Main", bundle: nil)
         let desVC = mainStoryBoard.instantiateViewController(withIdentifier: "ActivityDetailsViewController") as! ActivityDetailsViewController
      
         desVC.placNameReceived = "\(touristActivity.placeName)"
         desVC.imageReceived = touristActivity.image
         desVC.descriptionReceived = "\(touristActivity.description)"
         desVC.hostReceived = "\(touristActivity.host)"
         desVC.priceReceived = "\(touristActivity.pricePerPerson)"
         desVC.price = touristActivity.price
         desVC.websiteButton(touristActivity.website)
         desVC.websiteReceived = touristActivity.website
         self.navigationController?.pushViewController(desVC , animated: true)

    }
    private func collectionView(_ collectionView: UICollectionView,
                                 shouldHighlightItemAt indexPath: IndexPath)  {
        if let cell = collectionView.cellForItem(at: indexPath){
           cell.contentView.backgroundColor = #colorLiteral(red: 1, green: 0.4932718873, blue: 0.4739984274, alpha: 1)
       }
//       collectionView
//       The collection view object that is asking about the highlight change.
//
//       indexPath
//       The index path of the cell to be highlighted.
}
}
