
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:school19/announcement/announcement_response_model.dart';


class CustomTextSlider extends StatefulWidget {
  final List<AnnouncementList> announcementList ;
  final List grade;
  final double sliderAspectRatio;
  final Color? sliderColor;
  final bool isHorizontal;
  final BoxDecoration? sliderBoxDecoration;

  const CustomTextSlider({Key? key, required this.announcementList, required this.sliderAspectRatio, this.sliderColor, required this.isHorizontal, this.sliderBoxDecoration, required this.grade,}) : super(key: key);
  @override
  State<CustomTextSlider> createState() => _CustomTextSliderState();

}

class _CustomTextSliderState extends State<CustomTextSlider> {
  int _current = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider(
          options: CarouselOptions(
            autoPlay: true,
            aspectRatio: widget.sliderAspectRatio,
            enlargeCenterPage: false,
            viewportFraction: 1,
            onPageChanged: (index, reason) {
              setState(() {
                _current = index;
              });
            },
          ),
          items:  widget.isHorizontal?
          widget.grade
              .map(
                (item) =>
                Container(
                    width: MediaQuery.of(context).size.width,
                    color: widget.sliderColor,
                    decoration: widget.sliderBoxDecoration,
                    child:
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Myanmar'),
                          Text('$item'),
                        ],
                      ),
                    )
                ),
          )
              .toList():
          widget.announcementList
              .map(
                (item) =>
                Container(
                    width: MediaQuery.of(context).size.width,
                    color: widget.sliderColor,
                    decoration: widget.sliderBoxDecoration,
                    child:
                    Padding(
                      padding: const EdgeInsets.only(left: 16.0,right: 16.0,top: 16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Align(alignment: Alignment.center,child: Text("${item.title}",style: const TextStyle(color: Colors.white),)),
                          const SizedBox(height: 10,),
                          Expanded(child: Text('${item.body}',style: const TextStyle(color: Colors.white),))
                        ],
                      ),
                    )

                ),
          ).toList(),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children:widget.isHorizontal? widget.grade.map((url) {
            int index = widget.grade.indexOf(url);
            return _buildContainer(index);
          }).toList() :
          widget.announcementList.map((url) {
            int index = widget.announcementList.indexOf(url);
            return _buildContainer(index);
          }).toList()
        ),
      ],

    );
  }
  Widget _buildContainer(int index){
    return  Container(
      width: 8.0,
      height: 8.0,
      margin:
      const EdgeInsets.symmetric(vertical: 8.0, horizontal: 2.0),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: _current == index
            ? const Color.fromRGBO(0, 0, 0, 0.9)
            : const Color.fromRGBO(0, 0, 0, 0.4),
      ),
    );
  }
}
