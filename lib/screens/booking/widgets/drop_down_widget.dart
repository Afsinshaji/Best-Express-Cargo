import 'package:best_seller/constant/const.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DropDownListWidget extends StatefulWidget {
  const DropDownListWidget(
      {super.key,
      required this.title,
      required this.hintText,
      required this.boxWidth});
  final String title;
  final String hintText;
  final double boxWidth;
  @override
  State<DropDownListWidget> createState() => _DropDownListWidgetState();
}

class _DropDownListWidgetState extends State<DropDownListWidget> {
  final List<String> items = [
    'Messi',
    'CCL BEST OFFICE',
    'A_Item3',
    'A_Item4',
    'B_Item1',
    'B_Item2',
    'B_Item3',
    'B_Item4',
  ];

  String? selectedValue;
  final TextEditingController textEditingController = TextEditingController();

  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.title,
          style: GoogleFonts.sora(
              textStyle: const TextStyle(
                  fontSize: 14, fontWeight: FontWeight.bold, color: logoRed)),
        ),
        Container(
          // width: MediaQuery.sizeOf(context).width / widget.boxWidth,
          decoration: BoxDecoration(
            color: greyShade,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Center(
            child: DropdownButtonHideUnderline(
              child: DropdownButton2<String>(
               
                isExpanded: true,
                hint: Text(
                  widget.hintText,
                  style: TextStyle(
                    fontSize: 14,
                    color: Theme.of(context).hintColor,
                  ),
                ),
                items: items
                    .map((item) => DropdownMenuItem(
                          value: item,
                          child: Text(
                            item,
                            style: const TextStyle(
                              fontSize: 14,
                            ),
                          ),
                        ))
                    .toList(),
                value: selectedValue,
                onChanged: (value) {
                  setState(() {
                    selectedValue = value;
                  });
                },
                buttonStyleData:  ButtonStyleData(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  height: 40,
                  width: widget.boxWidth,
                ),
                dropdownStyleData: const DropdownStyleData(
                  maxHeight: 200,
                ),
                menuItemStyleData: const MenuItemStyleData(
                  height: 40,
                ),
                dropdownSearchData: DropdownSearchData(
                  searchController: textEditingController,
                  searchInnerWidgetHeight: 50,
                  searchInnerWidget: Container(
                    height: 50,
                    padding: const EdgeInsets.only(
                      top: 8,
                      bottom: 4,
                      right: 8,
                      left: 8,
                    ),
                    child: TextFormField(
                      expands: true,
                      maxLines: null,
                      controller: textEditingController,
                      decoration: InputDecoration(
                        isDense: true,
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 8,
                        ),
                        hintText: 'Search for an item...',
                        hintStyle: const TextStyle(fontSize: 12),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                  ),
                  searchMatchFn: (item, searchValue) {
                    final itemValue = item.value.toString().toLowerCase();
                    final searchValueLower = searchValue.toLowerCase();
                    return itemValue.contains(searchValueLower);
                  },
                ),
                //This to clear the search value when you close the menu
                onMenuStateChange: (isOpen) {
                  if (!isOpen) {
                    textEditingController.clear();
                  }
                },
                
              ),
              
            ),
          ),
        ),
      ],
    );
  }
}
