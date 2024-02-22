import 'package:flutter/material.dart';
import 'package:sort_product/global.dart';

class ProductFilter extends StatefulWidget {
  const ProductFilter({super.key});

  @override
  State<ProductFilter> createState() => _ProductFilterState();
}

double filteredAmt = 1500;

class _ProductFilterState extends State<ProductFilter> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
        centerTitle: true,
        title: const Text(
          'Product Filter',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
        ),
        actions: const [
          Icon(
            Icons.apps,
            color: Colors.white,
            size: 30,
          )
        ],
      ),
      body: Center(
        child: Column(
          children: [
            Slider(
              min: 0,
              max: 1500,
              divisions: 1500,
              activeColor: Colors.redAccent,
              value: filteredAmt,
              onChanged: (value) {
                filteredAmt = value;
                setState(() {});
              },
            ),
            Text(
              'All Product < \$${filteredAmt.toStringAsFixed(0)} months',
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            Expanded(
              child: ListView(
                children: [
                  ...List.generate(
                      productData.length,
                      (index) => (productData[index]['price'] < filteredAmt)
                          ? productBox(index)
                          : Container())
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget productBox(int index) {
    return Container(
      margin: const EdgeInsets.all(8),
      decoration: BoxDecoration(
          borderRadius: BorderRadiusDirectional.circular(10),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                blurRadius: 2,
                offset: const Offset(0, 4))
          ]),
      child: ListTile(
        title: Text(
          productData[index]['name'],
          style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w700,color: Colors.redAccent),
        ),
        subtitle: Text(
          productData[index]['brand'],
          style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w700,color: Colors.redAccent),
        ),
        leading: Text(
          '${productData[index]['id']}',
          style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w700,color: Colors.redAccent),
        ),
        trailing: Text(
          '\$${productData[index]['price']}',
          style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w700,color: Colors.redAccent),
        ),
      ),
    );
  }
}
