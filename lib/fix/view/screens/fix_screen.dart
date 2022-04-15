import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../home/view/widgets/app_title_app_bar.dart';
import '../../../home/view/widgets/profile_icon_appBar.dart';
import '../../bloc/fix_bloc.dart';
import '../../data/models/fix.dart';
import 'video_playing.dart';
import '../widgets/common_issues_widget.dart';

class FixScreen extends StatefulWidget {
  const FixScreen({Key? key}) : super(key: key);

  @override
  State<FixScreen> createState() => _FixScreenState();
}

class _FixScreenState extends State<FixScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 5.h, right: 5.w, left: 5.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              AppTitleAppBar(
                title: 'Fix',
                textColor: Colors.black,
              ),
              ProfileIconAppBar(),
            ],
          ),
          SizedBox(
            height: 10.h,
          ),
          Expanded(
            child: ListView(
              children: [
                const VideoPlaying(),
                SizedBox(
                  height: 25.h,
                ),
                Text(
                  'Common Issues',
                  style: TextStyle(
                    fontFamily: 'Signika',
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w400,
                    color: const Color(0xff7B7B7B),
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                const CommonIssuesWidget(
                  title: 'Intact Limb Pain',
                  description:
                      'Overuse syndrome is well documented in amputees, where additional and atypical amounts of time and pressure are borne down through the intact limb. Over time, this can and will cause early degeneration of the lower back, hip, knee and ankle resulting in discomfort and other complications. This becomes even more important if there are injuries to the intact limb, which make it even more critical that the prosthesis be designed to evenly bear the load and smooth out every step in your gait.',
                ),
                const CommonIssuesWidget(
                  title: 'Back Pain',
                  description:
                      'There are few things in life more frustrating than back pain. Walking with a poorly fit prosthesis or with sub-optimal gait habits can cause long term structural changes in the body that will result in muscular pain and eventually long term neurological pain. Most users of a prosthesis will at some time encounter back pain due to compensation for the loss of your limb. At MCOP, we work closely with the leading gait experts in prosthetics because we know that success with a prosthesis is the result of the sum of many parts. The socket, the technology, the training, and the breaking of bad gait habits are all essential to address the issues that cause back pain.',
                ),
                const CommonIssuesWidget(
                  title: 'Current Prosthetic Not Meeting Your Needs',
                  description:
                      'The first rule of prosthetics is safety first.  Once safety is ensured, efficiency and dynamics become the next key to choosing the right prosthetic technology. If you feel held back by your current prosthetic, or are unable to do certain activities, you may not have the right prosthetic technology for your needs.  A number of specialized prosthetic designs exist for every need, whether you wear a prosthetic to ride a bike, ski or snowboard, sprint, or run long distances, the technology is out there.  There are shock absorbing prosthetic designs for high impact activities, and designs that are lightweight and optimized for easy low impact walking. Whatever your needs, we have the experience and knowledge to suggest the right technology the first time, so that you can get the most out of your prosthesis.',
                ),
                const CommonIssuesWidget(
                  title: 'Poor Balance, Instability, or a Fear of Falling',
                  description:
                      'If you experience any of these issues, there is a good chance that it is not properly aligned. Over the months and years of use your limb may have subtle changes that reduce your control of the prosthesis. If however your socket fits well and you are comfortable then there is likelihood that the “alignment” of your prosthetic components are not optimized. If you are experiencing what feels like rotation of a knee or foot, a sensation of walking on the edge of your foot, or feel like you have a hitch in your step then adjustments are likely needed to your prosthesis to remedy the issue. MCOP’s skilled team works to optimize prosthetic performance and alignment and make adjustments before they begin causing problems.',
                ),
                const CommonIssuesWidget(
                  title: 'Irritation and Skin Issues',
                  description:
                      'Research has shown that as many as 74% of amputees have skin issues associated with prosthetic wear1. Sometimes these are minor and do not effect use, but oftentimes if the cause is untreated they progress to a new level.\n We are specialists in understanding the skin/prosthetic interface and we are often asked to work directly with manufacturers to understand the causes and prevent the occurrence of skin irritation and breakdown.  If you feel rubbing in your prosthesis, that is the result of mechanical friction and pressure combined which can cause irritation and skin issues. Socket shape and fit along with stabilizing the soft tissue are all important to prevent this and preserve the long term health of your skin. We utilize a variety of Gel and Silicone materials to match the skin’s needs and dissipate friction or pressure to reduce irritation. If you experience liner or skin breakdown you should be even more concerned. A stable socket environment protects you and the liner both equally, and breakdown is the result of issues with the socket.\n Our expert prosthetists are experienced at resolving skin issues and reducing and preventing skin breakdown through the careful application of the latest socket, interface, and suspension technologies.',
                ),
                const CommonIssuesWidget(
                  title: 'Socket Issues or Discomfort',
                  description:
                      'Proper socket fitting requires a skilled clinician and a plan tailored to your unique needs. Without a sound clinical plan, socket fitting can take far too long, yet still provide little in the way of improvement and comfort. Unfortunately, a one-size-fits-all approach is used in the prosthetic industry, which inevitably compromises comfort and your ability. Ask yourself, is your current socket: \n Easy to put on and take off? \n Wearable all day without causing irritation or discomfort? \n Giving you full and complete control of the prosthesis? \n If your answer to any of the above questions is no, you should consider other options. If your current efforts are not solving the issues you are facing, contact us for a specialist opinion on the many available solutions which you may not have tried.',
                ),
                SizedBox(
                  height: 20.h,
                ),
                MaterialButton(
                    child: BlocBuilder<FixBloc, FixState>(
                      builder: (context, state) {
                        if (state is FixLoadedState) {
                          String fixButtonLabel = 'Send a fix request';
                          for (Fix fix in state.fixList) {
                            if (fix.id ==
                                FirebaseAuth.instance.currentUser!.uid) {
                              fixButtonLabel = 'Sended';
                            }
                          }
                          return Text(
                            fixButtonLabel,
                            style: TextStyle(
                              fontFamily: 'Signika',
                              fontSize: 18.sp,
                              color: Colors.white,
                            ),
                          );
                        }
                        return Center(
                            child: CircularProgressIndicator(
                          color: Colors.orange.shade900,
                        ));
                      },
                    ),
                    color: Colors.orange.shade800,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.h)),
                    minWidth: 200.w,
                    height: 45.h,
                    onPressed: () {
                      BlocProvider.of<FixBloc>(context)
                          .add(FixAddRequestEvent());
                      BlocProvider.of<FixBloc>(context).add(FixGetDataEvent());
                    })
              ],
            ),
          ),
        ],
      ),
    );
  }
}
