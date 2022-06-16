import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';
import 'package:zemoga_flutter_app/features/details/display/provider/details_provider.dart';
import 'package:zemoga_flutter_app/generated/l10n.dart';

class DetailsPage extends StatefulWidget {
  const DetailsPage({
    Key? key,
    required this.body,
    required this.postId,
    required this.userId,
  }) : super(key: key);

  final String body;
  final int postId;
  final int userId;

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  @override
  void initState() {
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      Provider.of<DetailsProvider>(context, listen: false)
        ..eitherFailureOrCommentsList(widget.postId)
        ..eitherFailureOrUser(widget.userId);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final comments = Provider.of<DetailsProvider>(context).commentsList;
    final failure = Provider.of<DetailsProvider>(context).failure;
    final user = Provider.of<DetailsProvider>(context).user;
    final localizations = AppLocalizations.of(context);

    if (comments != null && user != null) {
      return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(localizations.mainPageTitle),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      localizations.descriptionTitle,
                      style: const TextStyle(
                        fontSize: 24.0,
                      ),
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    Text(
                      widget.body,
                      textAlign: TextAlign.justify,
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    Text(
                      localizations.user,
                      style: const TextStyle(
                        fontSize: 24.0,
                      ),
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    Text(
                      '${localizations.userName}: ${user.name}',
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    Text(
                      '${localizations.userEmail}: ${user.email}',
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    Text(
                      '${localizations.userPhone}: ${user.phone}',
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    Text(
                      '${localizations.userWebsite}: ${user.website}',
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                  ],
                ),
              ),
              Container(
                alignment: Alignment.centerLeft,
                color: Colors.grey,
                height: 50,
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: Text(
                    localizations.commentsTitle,
                    style: const TextStyle(color: Colors.white, fontSize: 20.0),
                  ),
                ),
              ),
              const SizedBox(
                height: 1.0,
              ),
              SizedBox(
                width: double.infinity,
                height: 300.0,
                child: ListView.separated(
                  itemBuilder: (context, index) => Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(comments[index].body),
                  ),
                  itemCount: comments.length,
                  padding: const EdgeInsets.only(
                    bottom: 50.0,
                  ),
                  physics: const BouncingScrollPhysics(),
                  separatorBuilder: (context, index) => const Divider(),
                ),
              )
            ],
          ),
        ),
      );
    } else if (failure != null) {
      return Expanded(
        child: Center(
          child: Text(
            failure.errorMessage!,
            style: const TextStyle(fontSize: 20),
          ),
        ),
      );
    }

    return const Expanded(
      child: Center(
        child: CircularProgressIndicator(
          backgroundColor: Colors.white,
          color: Colors.green,
        ),
      ),
    );
  }
}
