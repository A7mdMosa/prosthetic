import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../bloc/cart_bloc.dart';
import '../../bloc/products_bloc.dart';
import '../widgets/searching_field.dart';
import '../widgets/product_grid_item.dart';
import '../widgets/cart_icon_app_bar.dart';
import '../../../home/view/widgets/app_title_app_bar.dart';
import '../../../home/view/widgets/profile_icon_appBar.dart';

class StoreScreen extends StatefulWidget {
  const StoreScreen({Key? key}) : super(key: key);

  @override
  State<StoreScreen> createState() => _StoreScreenState();
}

class _StoreScreenState extends State<StoreScreen> {
  @override
  void initState() {
    super.initState();
    //Loading Product.
    BlocProvider.of<ProductsBloc>(context).add(ProductsLoadingEvent());
    //Loading cart items.
    BlocProvider.of<CartBloc>(context).add(CartLoadingEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 5.h, right: 5.w, left: 5.w),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Row(
          children: [
            const AppTitleAppBar(
              title: 'Store',
              textColor: Colors.black,
            ),
            SizedBox(
              width: 140.w,
            ),
            const CartIconAppBar(),
            SizedBox(
              width: 20.w,
            ),
            const ProfileIconAppBar(),
          ],
        ),
        SizedBox(
          height: 10.h,
        ),
        SearchingField(),
        Expanded(
          //Products building.
          child: BlocBuilder<ProductsBloc, ProductsState>(
              builder: (context, state) {
            if (state is ProductsLoadedState) {
              return GridView.builder(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                  itemCount: state.products.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 1 / 1.5,
                    crossAxisSpacing: 15.w,
                    mainAxisSpacing: 20.h,
                  ),
                  itemBuilder: (context, index) {
                    return ProductGridItem(
                      product: state.products[index],
                    );
                  });
            } else if (state is ProductsSearchingState) {
              //search building.
              return GridView.builder(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                  itemCount: state.products.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 1 / 1.5,
                    crossAxisSpacing: 15.w,
                    mainAxisSpacing: 20.h,
                  ),
                  itemBuilder: (context, index) {
                    return ProductGridItem(
                      product: state.products[index],
                    );
                  });
            }
            //Loading...
            return const Center(
              child: CircularProgressIndicator(
                color: Colors.black,
              ),
            );
          }),
        ),
      ]),
    );
  }
}
