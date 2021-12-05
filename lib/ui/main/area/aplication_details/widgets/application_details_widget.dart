
import 'package:e_space_mobile/controller/map/main_map_controller.dart';
import 'package:e_space_mobile/core/theme/app_colors.dart';
import 'package:e_space_mobile/core/theme/app_text_style.dart';
import 'package:e_space_mobile/data/models/area/single_entity/single_entity_model.dart';
import 'package:e_space_mobile/routes/app_routes.dart';
import 'package:e_space_mobile/ui/main/area/aplication_details/widgets/button_download.dart';
import 'package:e_space_mobile/ui/main/area/aplication_details/widgets/title_subtitle_widget.dart';
import 'package:e_space_mobile/ui/main/map/widgets/custom_map_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:intl/intl.dart';

class ApplicationDetailsWidget extends StatelessWidget {
  const ApplicationDetailsWidget({
    Key? key,
    required this.status,
    required this.statusColor,
    required this.date,
    required this.address,
    required this.singleEntityDraftResponse,
  }) : super(key: key);

  final String status;
  final String statusColor;
  final String date;
  final String address;
  final SingleEntityModel? singleEntityDraftResponse;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Container(
          margin: EdgeInsets.all(16),
          decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(6)
          ),
          padding: EdgeInsets.symmetric(horizontal: 12),
          child: ListView(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 14),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(child:
                    Text(
                        'offer'.tr,
                        style: AppTextStyles.applicationName)),
                    const SizedBox(width: 4),
                    Container(
                      padding: EdgeInsets.all(4),
                        decoration: BoxDecoration(
                            color: Color(int.parse('0xFF${statusColor.replaceAll('#','')}')),
                            borderRadius: BorderRadius.circular(4)
                        ),
                        child: Center(
                            child: Text(
                                status,
                                textAlign: TextAlign.center,
                                style: AppTextStyles.auctionStatus)
                        )
                    ),
                  ],
                ),
              ),
              TitleSubtitleWidget(
                  subTitle: date.isNotEmpty?
                  DateFormat('dd.MM.yyyy').format(DateTime.parse(date)):'',
                  title: 'date_application'.tr
              ),
              const Divider(),
              TitleSubtitleWidget(
                  subTitle: singleEntityDraftResponse?.city?.name??'',
                  title: 'region'.tr
              ),
              const Divider(),
              TitleSubtitleWidget(
                  subTitle: singleEntityDraftResponse?.region?.name??'',
                  title: 'district'.tr
              ),
              Visibility(
                  visible: (singleEntityDraftResponse?.district?.name??'').isNotEmpty,
                  child: const Divider()),
              Visibility(
                visible: (singleEntityDraftResponse?.district?.name??'').isNotEmpty,
                child: TitleSubtitleWidget(
                    subTitle: singleEntityDraftResponse?.district?.name??'',
                    title: 'village'.tr
                ),
              ),
              const Divider(),
              TitleSubtitleWidget(
                  subTitle: address,
                  title: 'address'.tr
              ),
              for(int i=0;i<(singleEntityDraftResponse?.entityProperties?.length??0);i++)
                if(singleEntityDraftResponse?.entityProperties?[i].property?.type!='map')
                  Column(
                    children: [
                      const Divider(),
                      TitleSubtitleWidget(
                          title: singleEntityDraftResponse?.entityProperties?[i].property?.name??'',
                          subTitle: singleEntityDraftResponse?.entityProperties?[i].value??'',
                        fileType: singleEntityDraftResponse?.entityProperties?[i].property?.type=='file'?
                        'PDP':null,
                      ),
                    ],
                  )
                else
              GetBuilder<MainMapController>(
                builder: (logic) {
                  logic.setNewPositionByValue(
                      singleEntityDraftResponse?.entityProperties?[i].value??'');
                  return Container(
                  height: Get.width / 2,
                  width: double.infinity,
                  decoration:  BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.circular(12)),
                  child: Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: GoogleMap(
                          mapType: MapType.normal,
                          onMapCreated: (GoogleMapController cont) {
                            logic.setGoogleMapController(cont);
                          },
                          initialCameraPosition: logic.kGooglePlex,
                          markers: logic.markers,
                          myLocationEnabled: false,
                          polygons: logic.createPolygonByValue(
                              singleEntityDraftResponse?.entityProperties?[i].value??''),
                        ),
                      ),
                      Positioned(
                        top: 12,
                        left: 12,
                        child: MapCustomButton(
                          onTap: () {
                            Get.toNamed(
                                Routes.SIMPLE_MAP,
                                arguments: singleEntityDraftResponse?.entityProperties?[i].value??'');
                          },
                          icon: 'ic_make_bigger',
                        ),
                      ),
                    ],
                  ),
                );}
              ),
              const SizedBox(height: 12)
            ],
          ),
        ),
        const SizedBox(height: 6),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            ButtonDownloadWidget(
              onTap: () {  },
              title: 'JSON',
            ),
            const SizedBox(width: 20),
            ButtonDownloadWidget(
              onTap: () {  },
              title: 'PDF ',
            ),
            const SizedBox(width: 16)
          ],
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}
