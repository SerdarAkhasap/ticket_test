import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:online_plane_ticket/app/app.dart';
import 'package:online_plane_ticket/app/utils/app_colors.dart';
import 'package:online_plane_ticket/app/utils/assets.gen.dart';
import 'package:online_plane_ticket/app/utils/utils.dart';
import 'package:online_plane_ticket/domain/entities/ticket_model.dart';
import 'package:speed_up_flutter/speed_up_flutter.dart';

class TicketItem extends StatelessWidget {
  const TicketItem({super.key, required this.item});

  final TicketModel item;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 16),
      width: double.infinity,
      height: 140,
      child: Stack(
        children: [
          Positioned(
            top: 10,
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              padding: const EdgeInsets.fromLTRB(16, 16, 4, 16),
              decoration: BoxDecoration(
                  color: AppColors.grey1,
                  borderRadius: BorderRadius.circular(8)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${formatPrice(item.price.value)} ₽ ',
                    style: const TextStyle(
                        fontSize: 22, fontWeight: FontWeight.w600),
                  ),
                  10.h,
                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    titleAlignment: ListTileTitleAlignment.center,
                    dense: true,
                    visualDensity: VisualDensity.compact,
                    leading: const CircleAvatar(
                      radius: 12,
                      backgroundColor: AppColors.red,
                    ),
                    title: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          getTimeFromDateTime(
                            item.departure.date,
                          ),
                          style: const TextStyle(fontSize: 14),
                        ),
                        Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 2),
                            child: Assets.icons.minus.svg()),
                        Text(
                          getTimeFromDateTime(
                            item.arrival.date,
                          ),
                          style: const TextStyle(fontSize: 14),
                        ),
                        13.w,
                        Text(
                          '${diffDateInHours(item.departure.date, item.arrival.date)}ч в пути',
                          style: const TextStyle(fontSize: 14),
                        ),
                        if (item.hasTransfer)
                          const Text(
                            '/ Без пересадок',
                            maxLines: 1,
                            style: TextStyle(
                                fontSize: 14, overflow: TextOverflow.ellipsis),
                          ),
                      ],
                    ),
                    subtitle: Row(
                      children: [
                        Text(
                          '${item.departure.airport}        ${item.arrival.airport}',
                          style: const TextStyle(
                              fontSize: 14, color: AppColors.grey5),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          if (item.badge != null)
            Positioned(
              top: 0,
              left: 0,
              child: Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 2, horizontal: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: AppColors.blueBtn,
                ),
                child: Text(
                  item.badge ?? '',
                  style: const TextStyle(fontSize: 14, color: AppColors.white),
                ),
              ),
            )
        ],
      ),
    );
  }
}
