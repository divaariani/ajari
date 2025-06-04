import 'package:ajari/models/learning_model.dart';
import 'package:ajari/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  List<LearningModel?> learningData = [];

  @override
  void initState() {
    super.initState();
    learningData = [
      // Mockup data
      LearningModel(
        subject: "Mathematics",
        teacher: "By Liam Bennet",
        type: "Video",
        materialCount: 2,
        taskCount: 2,
        desc:
            "Mathematics is the study of numbers, shapes, and patterns. It involves understanding concepts such as addition, subtraction, multiplication, and division, as well as more complex topics like algebra and geometry.",
        imageUrl:
            "https://news.harvard.edu/wp-content/uploads/2022/11/iStock-mathproblems.jpg",
      ),
      LearningModel(
        subject: "Science",
        teacher: "By Jane Doe",
        type: "Offline Activity",
        materialCount: 3,
        taskCount: 1,
        desc:
            "Science is the systematic study of the natural world through observation and experimentation. It encompasses various fields such as biology, chemistry, and physics, aiming to understand the laws governing the universe.",
        imageUrl:
            "https://www.unc.edu/wp-content/uploads/2022/01/hero_scienceinthestacks-1200x675.jpg",
      ),
      LearningModel(
        subject: "History",
        teacher: "By John Smith",
        type: "Video",
        materialCount: 1,
        taskCount: 2,
        desc:
            "History is the study of past events, particularly in human affairs. It involves analyzing historical documents, artifacts, and other sources to understand how societies have evolved over time.",
        imageUrl:
            "https://www.grace.edu/wp-content/uploads/2018/02/History-history-scaled.jpg,",
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
        elevation: 0,
        centerTitle: false,
        title: Row(
          children: [
            const Text(
              'Learning Pathway',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Spacer(),
            CircleAvatar(
              radius: 14,
              backgroundColor: AppColors.primary,
              child: Text(
                learningData.length.toString(),
                style: const TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(
              width: 12,
            ),
            const Icon(
              Icons.search,
              color: Colors.black,
              size: 32,
            ),
            const SizedBox(
              width: 6,
            ),
            Image.asset(
              'assets/icon_filter.png',
              width: 32,
              height: 32,
            ),
          ],
        ),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.grey[100],
        child: SafeArea(
          child: SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: learningData.map((model) {
                  if (model == null) {
                    return const SizedBox();
                  }

                  return GestureDetector(
                    onTap: () {
                      GoRouter.of(context).push(
                        '/detail',
                        extra: model,
                      );
                    },
                    child: Container(
                      margin: const EdgeInsets.only(bottom: 16),
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.2),
                            spreadRadius: 1,
                            blurRadius: 5,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(12),
                                child: Image.network(
                                  model.imageUrl ?? '',
                                  width: 65,
                                  height: 54,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              const SizedBox(
                                width: 12,
                              ),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      model.subject ?? '-',
                                      style: const TextStyle(
                                        fontSize: 12,
                                        color: AppColors.text,
                                      ),
                                    ),
                                    Text(
                                      model.teacher ?? '-',
                                      style: const TextStyle(
                                        fontSize: 10,
                                        color: AppColors.secondary,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 8,
                                    ),
                                    Row(
                                      children: [
                                        Container(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 8),
                                          decoration: BoxDecoration(
                                            color: Colors.grey[200],
                                            borderRadius:
                                                BorderRadius.circular(12),
                                          ),
                                          child: const Text(
                                            "Self Learning",
                                            style: TextStyle(
                                              color: AppColors.text,
                                              fontSize: 10,
                                            ),
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 4,
                                        ),
                                        Container(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 8),
                                          decoration: BoxDecoration(
                                            color: AppColors.purple,
                                            borderRadius:
                                                BorderRadius.circular(12),
                                          ),
                                          child: Text(
                                            model.type ?? '',
                                            style: const TextStyle(
                                              color: Colors.white,
                                              fontSize: 10,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                width: 8,
                              ),
                              Image.asset(
                                'assets/icon_list.png',
                                width: 32,
                                height: 32,
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          Divider(color: Colors.grey[400]),
                          const SizedBox(
                            height: 8,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    "Material",
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.grey,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 4,
                                  ),
                                  RichText(
                                    text: TextSpan(
                                      children: [
                                        TextSpan(
                                          text: '${model.materialCount ?? 0} ',
                                          style: const TextStyle(
                                            fontSize: 12,
                                            color: AppColors.text,
                                          ),
                                        ),
                                        const TextSpan(
                                          text: 'Learning Material',
                                          style: TextStyle(
                                            fontSize: 12,
                                            color: Colors.grey,
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                              SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.1),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    "Activities",
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.grey,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 4,
                                  ),
                                  RichText(
                                    text: TextSpan(
                                      children: [
                                        TextSpan(
                                          text: '${model.taskCount ?? 0} ',
                                          style: const TextStyle(
                                            fontSize: 12,
                                            color: AppColors.text,
                                          ),
                                        ),
                                        const TextSpan(
                                          text: 'Tasks',
                                          style: TextStyle(
                                            fontSize: 12,
                                            color: Colors.grey,
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
