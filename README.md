	The Problem
	-----------
	
	The best way to introduce Coordinator is probably to introduce the problem it aims to solve. As an iOS developer, we’ve all crossed path with some code where a UIViewController create the next one in the user flow.
	
```
extension ListViewController: UITableViewDelegate,UITableViewDataSource { 
 
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
     ...
     self.navigationController.pushViewController(detailsViewController, animated: true)
  
   }
}
```
	
	In this kind of code, one view controller must know about, create, configure, and present another. This creates tight coupling in our application: you have hard-coded the link from one view controller to another, and might even have to duplicate your configuration code if you want the same view controller shown from various places.
	
	Even worse, all this involves a child telling its navigation controller what to do – our first view controller is reaching up to its parent and telling it present a second view controller.
	
	This is when the Coordinator Pattern comes in handy, keeping a clean architecture and separation of concern.
	
	Your app flow is controlled using a coordinator, and your view communicates only with a coordinator.
	
	For larger apps, you can even create child coordinators – or subcoordinators – that let you carve off part of the navigation of your app. For example, you might control your account creation flow using one subcoordinator, and control your product subscription flow using another.
	
	
	What is the Coordinator Pattern?
	--------------------------------
	
	The Coordinator Pattern was first introduced to the iOS community by Soroush Khanlou (@khanlou) in his blog and during his presentation at the NSSpain conference.
	
	The idea of the Coordinator pattern is to create a separate entity — a Coordinator — which is responsible for the application’s flow. The Coordinator encapsulates a part of the application. The Coordinator knows nothing of its parent Coordinator, but it can start its child Coordinators.
	
	Coordinators create, present and dismiss UIViewControllers while keeping the UIViewControllers separate and independent. Similar to how UIViewControllers manage UIViews, Coordinators manage UIViewControllers.
	
	|                                        A
	|                                        |
	V                                        |
	----------------------------------------------
	|                                            |
	|                Coordinator                 |
	|                                            |
	----------------------------------------------
	|        A       |       A       |       A
	|        |       |       |       |       |
	V        |       V       |       V       |
	--------------  --------------  --------------
	|            |  |            |  |            |
	|    VC1     |  |    VC2     |  |    VC3     |
	|            |  |            |  |            |
	--------------  --------------  --------------
	
	
	What is a Coordinator?
	----------------------
	
	A Coordinator is an object the encapsulates a lifecycle that is spread over a collection of view controllers.
	
	"So what is a coordinator? A coordinator is an object that bosses one or more view controllers around. Taking all of the driving logic out of your view controllers, and moving that stuff one layer up is gonna make your life a lot more awesome."
	
	- Soroush Khanlou, Coordinators Redux
	
	
	What is the Pattern?
	--------------------
	
	The Coordinator pattern is really quite simple.
	
	"Ultimately, coordinators are just an organizational pattern. There’s no library you can use for coordinators because they’re so simple. There’s no pod you can install and nothing to subclass from. There’s not even really a protocol to conform to."
	
	- Soroush Khanlou, Coordinators Redux
