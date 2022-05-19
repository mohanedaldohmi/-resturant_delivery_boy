import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:resturant_delivery_boy/data/model/response/chat_model.dart';
import 'package:resturant_delivery_boy/helper/date_converter.dart';
import 'package:resturant_delivery_boy/provider/splash_provider.dart';
import 'package:resturant_delivery_boy/utill/dimensions.dart';
import 'package:resturant_delivery_boy/utill/images.dart';
import 'package:resturant_delivery_boy/utill/styles.dart';

import 'image_diaglog.dart';

class MessageBubble extends StatelessWidget {
  final Messages messages;
  const MessageBubble({Key? key, required this.messages}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: Dimensions.PADDING_SIZE_DEFAULT, vertical: Dimensions.PADDING_SIZE_EXTRA_SMALL),
      child: messages.deliverymanId != null?
      Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(Dimensions.PADDING_SIZE_SMALL),

        ),

        child: Padding(
          padding: const EdgeInsets.all(Dimensions.PADDING_SIZE_DEFAULT),
          child: Column(crossAxisAlignment: CrossAxisAlignment.end,
            children: [

              SizedBox(height: Dimensions.PADDING_SIZE_SMALL),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [

                  Flexible(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Theme.of(context).cardColor,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          bottomRight: Radius.circular(10),
                          bottomLeft: Radius.circular(10),
                        ),
                      ),
                      child: Container(child: Padding(
                        padding: EdgeInsets.all(messages.message != null?Dimensions.PADDING_SIZE_DEFAULT:0),
                        child: Text(messages.message??''),
                      ),),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: Dimensions.PADDING_SIZE_SMALL),
                    child: CircleAvatar(
                      radius: Dimensions.PADDING_SIZE_DEFAULT,
                      child: ClipRRect(
                        child: FadeInImage.assetNetwork(
                          placeholder: Images.placeholder_user, fit: BoxFit.cover, width: 40, height: 40,
                          image: '${Provider.of<SplashProvider>(context, listen: false).baseUrls?.deliveryManImageUrl}/${messages.deliverymanId?.image}',
                          imageErrorBuilder: (c, o, s) => Image.asset(Images.placeholder_user, fit: BoxFit.cover),
                        ),
                        borderRadius: BorderRadius.circular(50.0),
                      ),
                    ),
                  ),
                ],
              ),

              messages.attachment !=null? Container(height: 100,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemCount: messages.attachment?.length,
                  itemBuilder: (BuildContext context, index){
                    return  messages.attachment!.length > 0?
                    InkWell(
                      onTap: () => showDialog(context: context, builder: (ctx)  =>  ImageDialog(imageUrl: messages.attachment![index]), ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child:FadeInImage.assetNetwork(
                          placeholder: Images.placeholder_image, height: 100, width: 100, fit: BoxFit.cover,
                          image: '${messages.attachment![index] ?? ''}',
                          imageErrorBuilder: (c, o, s) => Image.asset(Images.placeholder_image, height: 100, width: 100, fit: BoxFit.cover),
                        ),
                      ),
                    ):SizedBox();

                  },),
              ):SizedBox(),



              SizedBox(height: Dimensions.PADDING_SIZE_SMALL),
              Text(DateConverter.localDateToIsoStringAMPM(DateTime.parse(messages.createdAt.toString())), style: rubikRegular.copyWith(color: Theme.of(context).hintColor,fontSize: Dimensions.FONT_SIZE_SMALL),),
              SizedBox(),
            ],
          ),
        ),
      ):
      Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(Dimensions.PADDING_SIZE_SMALL),

        ),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start,
          children: [
           // Text(messages.customerId?.name),
            SizedBox(height: Dimensions.PADDING_SIZE_SMALL),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: Dimensions.PADDING_SIZE_SMALL),
                  child: CircleAvatar(
                    radius: Dimensions.PADDING_SIZE_DEFAULT,
                    child: ClipRRect(
                      child: FadeInImage.assetNetwork(
                        placeholder: Images.placeholder_user, fit: BoxFit.cover, width: 40, height: 40,
                        image: '${Provider.of<SplashProvider>(context, listen: false).baseUrls?.customerImageUrl}/${messages.customerId?.image ?? ''}',
                        imageErrorBuilder: (c, o, s) => Image.asset(Images.placeholder_user, fit: BoxFit.cover),
                      ),
                      borderRadius: BorderRadius.circular(50.0),
                      // child: Image.asset(Images.placeholder_user), borderRadius: BorderRadius.circular(50.0),
                    ),
                  ),
                ),
                Flexible(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).secondaryHeaderColor,
                      borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(10),
                        topRight: Radius.circular(10),
                        bottomLeft: Radius.circular(10),
                      ),
                    ),
                    child: Container(child: Padding(
                      padding: EdgeInsets.all(messages.message != null?Dimensions.PADDING_SIZE_DEFAULT:0),
                      child: Text(messages.message??''),
                    ),),
                  ),
                ),
              ],
            ),
            messages.attachment !=null? Container(height: 100,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemCount: messages.attachment?.length,
                itemBuilder: (BuildContext context, index){
                  print('=======BABBABA===>${messages.attachment![index] ?? ''}',);
                  return  messages.attachment!.length > 0?
                  Padding(
                    padding: const EdgeInsets.only(left: Dimensions.PADDING_SIZE_DEFAULT,top: Dimensions.PADDING_SIZE_DEFAULT),
                    child:FadeInImage.assetNetwork(
                      placeholder: Images.placeholder_image, height: 100, width: 100, fit: BoxFit.cover,
                      image: '${messages.attachment![index] ?? ''}',
                      imageErrorBuilder: (c, o, s) => Image.asset(Images.placeholder_image, height: 100, width: 100, fit: BoxFit.cover),
                    ),
                  ):SizedBox();

                },),
            ):SizedBox(),
            SizedBox(height: Dimensions.PADDING_SIZE_SMALL),
            Text(DateConverter.localDateToIsoStringAMPM(DateTime.parse(messages.createdAt.toString())), style: rubikRegular.copyWith(color: Theme.of(context).hintColor,fontSize: Dimensions.FONT_SIZE_SMALL),),
          ],
        ),
      ),
    );
  }
}
