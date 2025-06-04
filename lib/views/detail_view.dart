import 'package:ajari/models/learning_model.dart';
import 'package:ajari/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_treeview/flutter_treeview.dart';
import 'package:go_router/go_router.dart';

class DetailView extends StatefulWidget {
  final LearningModel learning;

  const DetailView({super.key, required this.learning});

  @override
  State<DetailView> createState() => _DetailViewState();
}

class _DetailViewState extends State<DetailView> {
  late TreeViewController _treeViewController;
  LearningModel? detail;
  double progress = 0.1;

  final nodes = [
    const Node(
      label: 'Foundation of Number',
      key: 'ch1',
      icon: Icons.folder,
      children: [
        Node(
          label: 'Understanding Basic',
          key: 'sub11',
          icon: Icons.folder_open,
          children: [
            Node(
              label: 'Learning 1',
              key: 'learning111',
              icon: Icons.folder_copy,
            ),
          ],
        ),
        Node(
          label: 'Math Challange',
          key: 'sub12',
          icon: Icons.folder_open,
          children: [
            Node(
              label: 'Assignment 1',
              key: 'assignment111',
              icon: Icons.folder_copy,
            ),
          ],
        ),
      ],
    ),
    const Node(
      label: 'Function Nd Graphs',
      key: 'ch2',
      icon: Icons.folder,
      children: [
        Node(
          label: 'Understanding Basic',
          key: 'sub11',
          icon: Icons.folder_open,
          children: [
            Node(
              label: 'Learning 1',
              key: 'learning111',
              icon: Icons.folder_copy,
            ),
          ],
        ),
        Node(
          label: 'Math Challange',
          key: 'sub12',
          icon: Icons.folder_open,
          children: [
            Node(
              label: 'Assignment 1',
              key: 'assignment111',
              icon: Icons.folder_copy,
            ),
          ],
        ),
      ],
    ),
  ];

  @override
  void initState() {
    super.initState();
    detail = widget.learning;
    _treeViewController = TreeViewController(children: nodes);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            context.pop();
          },
        ),
        elevation: 0,
        centerTitle: false,
        title: Text(
          widget.learning.subject ?? 'Detail',
          style: const TextStyle(
              color: Colors.black, fontSize: 18, fontWeight: FontWeight.w700),
        ),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.grey[100],
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.all(16),
                  margin:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
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
                      ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.network(
                          detail?.imageUrl ?? '-',
                          width: double.infinity,
                          height: 100,
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Text(
                        detail?.subject ?? '-',
                        style: const TextStyle(
                            fontSize: 16,
                            color: AppColors.text,
                            fontWeight: FontWeight.w500),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            decoration: BoxDecoration(
                              color: Colors.grey[200],
                              borderRadius: BorderRadius.circular(12),
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
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            decoration: BoxDecoration(
                              color: AppColors.purple,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Text(
                              detail?.type ?? '-',
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 10,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Row(
                        children: [
                          const CircleAvatar(
                            backgroundImage: NetworkImage(
                              "https://thumbs.dreamstime.com/b/%D0%BF%D0%B5%D1%87%D0%B0%D1%82%D1%8C-woman-avatar-profile-female-face-icon-vector-illustration-190750711.jpg",
                            ),
                            radius: 24,
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    detail?.teacher ?? '-',
                                    style: const TextStyle(
                                      fontSize: 12,
                                      color: AppColors.text,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 8,
                                  ),
                                  const Icon(
                                    Icons.star,
                                    color: AppColors.yellow,
                                    size: 16,
                                  ),
                                  const Text(
                                    "4,5/5",
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: AppColors.text,
                                    ),
                                  ),
                                ],
                              ),
                              Text(
                                "${detail?.subject} Teacher",
                                style: const TextStyle(
                                  fontSize: 12,
                                  color: AppColors.secondary,
                                ),
                              ),
                            ],
                          ),
                          const Spacer(),
                          const Text(
                            "See Profile",
                            style: TextStyle(
                              fontSize: 12,
                              color: AppColors.primary,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Text(
                        detail?.desc ?? "-",
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontSize: 12,
                          color: Colors.grey,
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Divider(color: Colors.grey[400]),
                      const SizedBox(
                        height: 8,
                      ),
                      const Text(
                        "Progress",
                        style: TextStyle(
                          fontSize: 14,
                          color: AppColors.secondary,
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Stack(
                              children: [
                                Container(
                                  height: 10,
                                  decoration: BoxDecoration(
                                    color: AppColors.secondary.withOpacity(0.3),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                ),
                                FractionallySizedBox(
                                  widthFactor: progress,
                                  child: Container(
                                    height: 10,
                                    decoration: BoxDecoration(
                                      color: AppColors.primary,
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(width: 8),
                          Text(
                            "${(progress * 100).toStringAsFixed(0)}%",
                            style: const TextStyle(
                              fontSize: 12,
                              color: AppColors.text,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: AppColors.primary,
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: const Center(
                          child: Text(
                            "View Learning Detail",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(16),
                  margin:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
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
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Learning Detail',
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Text(
                            '2 Chapter · 3 Subchapter',
                            style: TextStyle(
                              fontSize: 12,
                              color: AppColors.secondary,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.2,
                        child: TreeView(
                          controller: _treeViewController,
                          allowParentSelect: false,
                          supportParentDoubleTap: false,
                          onNodeTap: (key) {
                            debugPrint('Node tapped: $key');
                          },
                          theme: TreeViewTheme(
                            expanderTheme: ExpanderThemeData(
                              type: ExpanderType.caret,
                              modifier: ExpanderModifier.none,
                              position: ExpanderPosition.start,
                              size: 20,
                              color: Colors.grey[700],
                            ),
                            labelStyle: const TextStyle(
                              fontSize: 14,
                              letterSpacing: 0.3,
                            ),
                            parentLabelStyle: const TextStyle(
                                fontWeight: FontWeight.w600,
                                color: Colors.black),
                            iconTheme: const IconThemeData(
                                size: 20, color: AppColors.primary),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
