import 'package:e_space_mobile/controller/map/main_map_controller.dart';
import 'package:e_space_mobile/core/theme/app_colors.dart';
import 'package:e_space_mobile/core/theme/app_text_style.dart';
import 'package:e_space_mobile/routes/app_routes.dart';
import 'package:e_space_mobile/ui/main/area/aplication_details/widgets/title_subtitle_widget.dart';
import 'package:e_space_mobile/ui/main/map/widgets/custom_map_button.dart';
import 'package:e_space_mobile/ui/main/profile/personal_info/widgets/disable_text_field.dart';
import 'package:flutter/material.dart';
import 'package:e_space_mobile/data/models/profile/entity_draft/single_entity_draft_response.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class ApplicationInfoWidget extends StatelessWidget {
  const ApplicationInfoWidget({
    Key? key,
    required this.singleEntityDraftResponse,
  }) : super(key: key);
  final SingleEntityDraftResponse? singleEntityDraftResponse;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Container(
              padding: EdgeInsets.all(12),
              margin: EdgeInsets.all(12),
              decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(10)
              ),
              child: ListView(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                children: [
                  Container(
                    decoration: BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: AppColors.bgTabBar,width: 1)
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 12),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 14),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(child:
                               Text(
                                  '${singleEntityDraftResponse?.entityDraftNumber??''}',
                                  style: AppTextStyles.applicationTopTitle)),
                              const SizedBox(width: 4),
                              Container(
                                padding: EdgeInsets.all(4),
                                  decoration: BoxDecoration(
                                      color:singleEntityDraftResponse!=null?
                                      Color(int.parse(
                                          '0xFF${singleEntityDraftResponse?.status?.color?.replaceAll('#','')}')):
                                      AppColors.assets,
                                      borderRadius: BorderRadius.circular(4)
                                  ),
                                  child: Center(
                                      child: Text(
                                          singleEntityDraftResponse?.status?.name??"",
                                          textAlign: TextAlign.center,
                                          style: AppTextStyles.auctionStatus)
                                  )
                              ),
                            ],
                          ),
                        ),
                        TitleSubtitleWidget(
                            subTitle: singleEntityDraftResponse?.city?.name??'',
                            title: 'region'.tr
                        ),
                        const Divider(),
                        TitleSubtitleWidget(
                            subTitle: singleEntityDraftResponse?.region?.name??'',
                            title: 'district'.tr
                        ),
                        const Divider(),
                        TitleSubtitleWidget(
                            subTitle: singleEntityDraftResponse?.district?.name??'',
                            title: 'village'.tr
                        ),
                        /*TitleSubtitleWidget(
                            subTitle: date.isNotEmpty?
                            DateFormat('dd.MM.yyyy').format(DateTime.parse(date)):'',
                            title: 'Дата подачи заявки'
                        ),*/
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
                        else GetBuilder<MainMapController>(
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
                                        // myLocationEnabled: false,
                                        polygons: logic.createPolygonByValue(
                                            singleEntityDraftResponse?.entityProperties?[i].value??''),
                                        onTap: (point) {
                                          if (logic.isPolygon) {
                                            logic.setPolygonPoints(point);
                                            logic.setPolygon();
                                          } else if (logic.isMarker) {
                                            logic.clearMarkers();
                                            logic.setMarker(point);
                                          }
                                        },
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
                              );
                              }
                            ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                  Container(
                      decoration: BoxDecoration(
                          color: AppColors.white,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: AppColors.bgTabBar,width: 1)
                      ),
                      padding: EdgeInsets.symmetric(horizontal: 12,vertical: 12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('applicant'.tr,style: AppTextStyles.applicationTopTitle),
                        const SizedBox(height: 12),
                        DisableTextField(
                          label: 'fio'.tr,
                          labelColor: AppColors.black,
                          hint: singleEntityDraftResponse?.applicant?.name??'',
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
      ],
    );
  }
}
