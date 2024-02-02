import 'package:flutter/material.dart';
import 'package:hank_talker_mobile/core/profile/models/region_model.dart';
import 'package:hank_talker_mobile/utils/file_type_interceptor.dart';

class CustomFlagDropdownButton extends StatelessWidget {
  final List<RegionModel> regions;
  final RegionModel? selectedRegion;
  final void Function(RegionModel?)? onChanged;

  const CustomFlagDropdownButton(
      {Key? key,
      required this.regions,
      required this.onChanged,
      this.selectedRegion})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<RegionModel>(
          value: selectedRegion == null
              ? null
              : regions.firstWhere(
                  (element) => element.id == selectedRegion!.id,
                  orElse: () => regions.first),
          icon: const Icon(Icons.arrow_drop_down),
          isExpanded: true,
          hint: const Text('Selecciona un país'),
          items: regions.map((option) {
            return DropdownMenuItem<RegionModel>(
              value: option,
              key: Key(option.id.toString()),
              child: Row(
                children: [
                  SizedBox(
                      height: 30,
                      width: 30,
                      child: FileInterceptorWidget(
                        fileUrl: option.flagUrl,
                      )),
                  const SizedBox(width: 6),
                  Text(option.description),
                ],
              ),
            );
          }).toList(),
          onChanged: onChanged,
        ),
      ),
    );
  }
}
