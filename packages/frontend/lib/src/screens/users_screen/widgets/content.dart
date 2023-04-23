part of '../users_screen.dart';

class Content extends StatelessWidget {
  const Content({
    super.key,
    required this.allUsers,
    required this.onGetAllUsers,
  });
  final List<shared.User> allUsers;
  final VoidCallback onGetAllUsers;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        k12Spacer,
        ElevatedButton(
          onPressed: onGetAllUsers,
          child: const Text('Get All Users'),
        ),
        k12Spacer,
        if (allUsers.isEmpty)
          const Expanded(
            child: Placeholder(),
          )
        else
          Expanded(
            child: ListView.builder(
              padding: kPadding12,
              itemCount: allUsers.length,
              itemBuilder: (BuildContext context, int index) {
                final shared.User user = allUsers[index];

                return Item<shared.User>(
                  object: user,
                  onDelete: null,
                  onTap: null,
                  textBuilder: (BuildContext context, shared.User user) =>
                      'User :: ${user.id} :: ${user.email} :: ${user.firstName} ${user.lastName}',
                );
              },
            ),
          ),
      ],
    );
  }
}
