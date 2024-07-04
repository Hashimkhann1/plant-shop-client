import 'package:plant_cli/utils/view.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final homeSectinokey = GlobalKey();
  final aboutSectinokey = GlobalKey();
  final categoriesSectinokey = GlobalKey();
  final contactSectinokey = GlobalKey();

  final ScrollController _scrollController = ScrollController();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  bool _showFAB = false;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_scrollListener);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_scrollListener);
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollListener() {
    final scrollPosition = _scrollController.position.pixels;
    if (scrollPosition > 400 && !_showFAB) {
      setState(() {
        _showFAB = true;
      });
    } else if (scrollPosition == 0 && _showFAB) {
      setState(() {
        _showFAB = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.white,
      drawer: MyDrawer(
        homeOnTap: () { ScrollViewModel.scrollToSection(homeSectinokey);Navigator.pop(context);},
        onTap: () { ScrollViewModel.scrollToSection(contactSectinokey);Navigator.pop(context);},
        aboutOnTap: () { ScrollViewModel.scrollToSection(aboutSectinokey);Navigator.pop(context);},
        categoriesOnTap: () { ScrollViewModel.scrollToSection(categoriesSectinokey); Navigator.pop(context);},
      ),
      body: SingleChildScrollView(
        controller: _scrollController,
        child: Column(
          children: [
            /// welcome section
            Container(
              key: homeSectinokey,
              width: width,
              height:
                  Responsive.isTablet(context) || Responsive.isMobile(context)
                      ? height * 0.78
                      : height * 0.99,
              decoration: BoxDecoration(
                color: Colors.black,
                image: DecorationImage(
                  image: const AssetImage('images/headerImage.jpg'),
                  fit: BoxFit.cover,
                  colorFilter: ColorFilter.mode(
                      Colors.black.withOpacity(0.35), BlendMode.darken),
                ),
              ),
              child: Column(
                children: [
                  /// Custome App bar
                  MyCustomeAppbar(
                    onTap: () => ScrollViewModel.scrollToSection(contactSectinokey),
                    aboutOnTap: () => ScrollViewModel.scrollToSection(aboutSectinokey),
                    categoriesOnTap: () =>
                        ScrollViewModel.scrollToSection(categoriesSectinokey),
                    openDrawerOnPressed: () {
                      _scaffoldKey.currentState?.openDrawer();
                    },
                  ),

                  /// home section view
                  HomeSectionView(onTap: () => ScrollViewModel.scrollToSection(aboutSectinokey),)

                ],
              ),
            ),
            SizedBox(
              height: Responsive.isMobile(context)
                  ? height * 0.06
                  : Responsive.isTablet(context)
                      ? 0.1
                      : height * 0.12,
            ),

            /// About us
            Container(key: aboutSectinokey, child: const AboutSectionView()),
            SizedBox(
              height: height * 0.07,
            ),

            /// slider
            const SliderSectionView(),
            SizedBox(
              height: height * 0.07,
            ),

            /// Categories Scction
            Container(key: categoriesSectinokey, child: CategorySectionView()),
            SizedBox(
              height: height * 0.04,
            ),

            /// contact Section
            Container(
                key: contactSectinokey, child: const ContactSectionView()),

            /// fotter
            Container(
              width: width,
              height: height * 0.12,
              padding: EdgeInsets.symmetric(horizontal: width * 0.05),
              decoration: BoxDecoration(color: Colors.black.withOpacity(0.04)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const MyText(
                    title: "Green and green md llc\nNursery & lawn care",
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),

                  /// Social buttons
                  Row(
                    children: [
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.facebook,
                            color: Colors.blueAccent,
                            size: 34,
                          )),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
      floatingActionButton: _showFAB
          ? FloatingActionButton(
              backgroundColor: AppColors.primaryColor,
              onPressed: () => ScrollViewModel.scrollToSection(homeSectinokey),
              child: const Icon(
                Icons.keyboard_arrow_up,
                color: AppColors.whiteColor,
                size: 30,
              ),
            )
          : null,
    );
  }
}
