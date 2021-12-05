import 'package:e_space_mobile/core/theme/app_colors.dart';
import 'package:e_space_mobile/core/theme/app_text_style.dart';
import 'package:e_space_mobile/data/models/area/actions/entity_action_history.dart';
import 'package:e_space_mobile/data/models/profile/entity_draft/entity_applicants_response.dart';
import 'package:e_space_mobile/ui/main/area/aplication_details/widgets/single_stage_widget.dart';
import 'package:e_space_mobile/ui/main/area/aplication_details/widgets/title_subtitle_widget.dart';
import 'package:e_space_mobile/ui/main/profile/personal_info/widgets/disable_text_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:e_space_mobile/data/models/profile/entity_draft/single_entity_draft_response.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:intl/intl.dart';

import 'suggestion_item_widget.dart';

class ApplicationActionInfoWidget extends StatelessWidget {
  const ApplicationActionInfoWidget({
    Key? key,
    required this.entity,
    required this.actionHistories,
    required this.entityDraftsApplicants
  }) : super(key: key);
  final List<ActionHistories> actionHistories ;
  final EntityInEntityDraft? entity;
  final List<EntityDrafts> entityDraftsApplicants;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Container(
              padding: const EdgeInsets.all(12),
              margin: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(10)
              ),
              child: ListView(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  Container(
                    decoration: BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: AppColors.bgTabBar,width: 1)
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 14),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(child:
                               Text(entity?.entityNumber??'',
                                  style: AppTextStyles.applicationTopTitle)),
                              const SizedBox(width: 4),
                            /*  Container(
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
                              ),*/
                            ],
                          ),
                        ),
                        TitleSubtitleWidget(
                            subTitle: entity?.city?.name??'',
                            title: 'region'.tr
                        ),
                        const Divider(),
                        TitleSubtitleWidget(
                            subTitle: entity?.region?.name??'',
                            title: 'district'.tr
                        ),
                        Visibility(
                            visible: (entity?.district?.name??'').isNotEmpty,
                            child: const Divider()),
                        Visibility(
                          visible: (entity?.district?.name??'').isNotEmpty,
                          child: TitleSubtitleWidget(
                              subTitle: entity?.district?.name??'',
                              title: 'village'.tr
                          ),
                        ),
                      /*  for(int i=0;i<(singleEntityDraftResponse?.entityProperties?.length??0);i++)
                          if(singleEntityDraftResponse?.entityProperties?[i].property?.type!='map')
                        Column(
                          children: [
                            const Divider(),
                            TitleSubtitleWidget(
                                title: singleEntityDraftResponse?.entityProperties?[i].property?.name??'',
                                subTitle: singleEntityDraftResponse?.entityProperties?[i].value??''
                            ),
                          ],
                        ),*/
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                  Visibility(
                    visible: actionHistories.isNotEmpty,
                    child: Container(
                        decoration: BoxDecoration(
                            color: AppColors.white,
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: AppColors.bgTabBar,width: 1)
                            ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 12,left: 12,right: 12,bottom: 4),
                              child: Text(
                                  'action_history'.tr,
                                  style: AppTextStyles.applicationTopTitle),
                                ),
                                ListView.builder(
                                    itemCount: actionHistories.length,
                                    shrinkWrap: true,
                                    physics: NeverScrollableScrollPhysics(),
                                    padding: EdgeInsets.all(12),
                                    itemBuilder: (context,index){
                                      var data = actionHistories[index];
                                      return SingleStageWidget(
                                        isLastItem: index == actionHistories.length-1,
                                        company: data.user?.organization?.name??'',
                                        date: data.createdAt??'',
                                        person: data.user?.firstName??'',
                                        time: data.createdAt??'',
                                        action: data.action??'',
                                      );
                                    }
                                ),
                              ],
                            )
                        ),
                  ),
                ],
              ),
        ),
        Visibility(
          visible: entityDraftsApplicants.isNotEmpty,
          child: Container(
            margin: EdgeInsets.fromLTRB(12,4,12,12),
            padding: EdgeInsets.all(12),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
              color: AppColors.white
            ),
            child: Column(
              children: [
                Text('suggestions_for_land_citizens'.tr,
                style: AppTextStyles.applicationTopTitle),
                const SizedBox(height: 12),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: AppColors.searchBarBg,width: 1),
                    borderRadius: BorderRadius.circular(8)
                  ),
                  child: ListView.separated(
                    itemCount: entityDraftsApplicants.length,
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (context,index){
                      var data = entityDraftsApplicants[index];
                        return SuggestionItemsWidget(
                          date: DateFormat('yyyy.MM.dd').format(DateTime.parse(data.createdAt??'')).toString(),
                          name: data.applicant?.name??'',
                          time: DateFormat.Hm().format(DateTime.parse(data.createdAt??'')).toString());
                      },
                    separatorBuilder: ( context,  index)=>
                        Divider(height: 0)
                  ),
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
