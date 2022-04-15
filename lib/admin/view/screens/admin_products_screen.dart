import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../store/data/models/product.dart';
import '../../../home/view/widgets/app_title_app_bar.dart';
import '../../../store/bloc/products_bloc.dart';
import '../widgets/edit_card_widget.dart';
import 'products_edit_screen.dart';

class AdminProductsScreen extends StatefulWidget {
  static const String route = '/products_screen';
  const AdminProductsScreen({Key? key}) : super(key: key);

  @override
  State<AdminProductsScreen> createState() => _AdminProductsScreenState();
}

class _AdminProductsScreenState extends State<AdminProductsScreen> {
  @override
  void initState() {
    super.initState();
    //loading products.
    BlocProvider.of<ProductsBloc>(context).add(ProductsLoadingEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          elevation: 0,
          title: const AppTitleAppBar(
              textColor: Colors.black, title: 'Edit Products'),
          leading: const BackButton(
            color: Colors.black,
          ),
        ),
        body: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: 5.h, horizontal: 10.w),
              child: MaterialButton(
                  child: Text(
                    'Add Product',
                    style: TextStyle(
                      fontFamily: 'Signika',
                      fontSize: 25.sp,
                      fontWeight: FontWeight.w400,
                      color: Colors.black,
                    ),
                  ),
                  color: Colors.orange.shade200,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.h),
                  ),
                  minWidth: 370.w,
                  height: 60.h,
                  onPressed: () {
                    //add new product and pass empty product.
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ProductsEditScreen(
                            product: Product(
                                id: '',
                                title: '',
                                image: '',
                                price: 0.0,
                                description1: '',
                                description2: '',
                                description3: '',
                                description4: '',
                                description5: '')),
                      ),
                    );
                  }),
            ),
            Expanded(
              child: BlocBuilder<ProductsBloc, ProductsState>(
                builder: (context, state) {
                  if (state is ProductsLoadedState) {
                    return ListView.builder(
                      itemCount: state.products.length,
                      itemBuilder: (BuildContext context, int index) {
                        return EditCardWidget(
                          title: state.products[index].title,
                          image: state.products[index].image,
                          edit: () {
                            //edit this product.
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ProductsEditScreen(
                                    product: state.products[index]),
                              ),
                            );
                          },
                          delete: () {
                            //delete this product.
                            BlocProvider.of<ProductsBloc>(context).add(
                              ProductsDeleteEvent(
                                  oldProduct: state.products[index]),
                            );
                            //load product after delete.
                            BlocProvider.of<ProductsBloc>(context)
                                .add(ProductsLoadingEvent());
                            Navigator.pop(context);
                          },
                        );
                      },
                    );
                  }
                  return Center(
                    child: CircularProgressIndicator(
                      color: Colors.orange.shade900,
                    ),
                  );
                },
              ),
            ),
          ],
        ));
  }
}
