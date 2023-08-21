import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:pagination_demo/modal/pagination_modal.dart';

import '../network/network.dart';

class PaginationService {
  final client = NetworkClient(http.Client());

  Future gePaginationData({required String page, required String item}) async {
    List<PaginationModal> paginationModelList = [];
    try {
      final response = await client.request(
        requestType: RequestType.GET,
        path: 'page=$page&per_page=$item',
      );
      if (response.statusCode == 200) {
        List homeDatasList = json.decode(response.body) as List;

        for (final homeData in homeDatasList) {
          PaginationModal hmData = PaginationModal(
            id: homeData['id'],
            nodeId: homeData['node_id '],
            name: homeData['name'],
            fullName: homeData['full_name'],
            private: homeData['private'],
            owner: Owner(
              login: homeData['owner']['login'],
              id: homeData['owner']['id'],
              nodeId: homeData['owner']['node_id'],
              avatarUrl: homeData['owner']['avatar_url'],
              gravatarId: homeData['owner']['gravatar_id'],
              url: homeData['owner']['url'],
              htmlUrl: homeData['owner']['html_url'],
              followersUrl: homeData['owner']['followers_url'],
              followingUrl: homeData['owner']['following_url'],
              gistsUrl: homeData['owner']['gists_url'],
              starredUrl: homeData['owner']['starred_url'],
              subscriptionsUrl: homeData['owner']['subscriptions_url'],
              organizationsUrl: homeData['owner']['organizations_url'],
              reposUrl: homeData['owner']['repos_url'],
              eventsUrl: homeData['owner']['events_url'],
              receivedEventsUrl: homeData['owner']['received_events_url'],
              type: homeData['owner']['type'],
              siteAdmin: homeData['owner']['site_admin'],
            ),
            htmlUrl: homeData['html_url'],
            description: homeData['description'],
            fork: homeData['fork'],
            url: homeData['url'],
            forksUrl: homeData['forks_url'],
            keysUrl: homeData['keys_url'],
            collaboratorsUrl: homeData['collaborators_url'],
            teamsUrl: homeData['teams_url'],
            hooksUrl: homeData['hooks_url'],
            issueEventsUrl: homeData['issue_events_url'],
            eventsUrl: homeData['events_url'],
            assigneesUrl: homeData['assignees_url'],
            branchesUrl: homeData['branches_url'],
            tagsUrl: homeData['tags_url'],
            blobsUrl: homeData['blobs_url'],
            gitTagsUrl: homeData['git_tags_url'],
            gitRefsUrl: homeData['git_refs_url'],
            treesUrl: homeData['trees_url'],
            statusesUrl: homeData['statuses_url'],
            languagesUrl: homeData['languages_url'],
            stargazersUrl: homeData['stargazers_url'],
            contributorsUrl: homeData['contributors_url'],
            subscribersUrl: homeData['subscribers_url'],
            subscriptionUrl: homeData['subscription_url'],
            commitsUrl: homeData['commits_url'],
            gitCommitsUrl: homeData['git_commits_url'],
            commentsUrl: homeData['comments_url'],
            issueCommentUrl: homeData['issue_comment_url'],
            contentsUrl: homeData['contents_url'],
            compareUrl: homeData['compare_url'],
            mergesUrl: homeData['merges_url'],
            archiveUrl: homeData['archive_url'],
            downloadsUrl: homeData['downloads_url'],
            issuesUrl: homeData['issues_url'],
            pullsUrl: homeData['pulls_url'],
            milestonesUrl: homeData['milestones_url'],
            notificationsUrl: homeData['notifications_url'],
            labelsUrl: homeData['labels_url'],
            releasesUrl: homeData['releases_url'],
            deploymentsUrl: homeData['deployments_url'],
            createdAt: homeData['created_at'],
            updatedAt: homeData['updated_at'],
            pushedAt: homeData['pushed_at'],
            gitUrl: homeData['git_url'],
            sshUrl: homeData['ssh_url'],
            cloneUrl: homeData['clone_url'],
            svnUrl: homeData['svn_url'],
            homepage: homeData['homepage'],
            size: homeData['size'],
            stargazersCount: homeData['stargazers_count'],
            watchersCount: homeData['watchers_count'],
            language: homeData['language'],
            hasIssues: homeData['has_issues'],
            hasProjects: homeData['has_projects'],
            hasDownloads: homeData['has_downloads'],
            hasWiki: homeData['has_wiki'],
            hasPages: homeData['has_pages'],
            hasDiscussions: homeData['has_discussions'],
            forksCount: homeData['forks_count'],
            mirrorUrl: homeData['mirror_url'],
            archived: homeData['archived'],
            disabled: homeData['disabled'],
            openIssuesCount: homeData['open_issues_count'],
            allowForking: homeData['allow_forking'],
            isTemplate: homeData['is_template'],
            webCommitSignoffRequired: homeData['web_commit_signoff_required'],
            visibility: homeData['visibility'],
            forks: homeData['forks'],
            openIssues: homeData['open_issues'],
            watchers: homeData['watchers'],
            defaultBranch: homeData['default_branch'],
          );
          paginationModelList.add(hmData);
        }

        return paginationModelList;
      }
    } catch (error) {
      print(error);

      print('catch profile Get {$error}');
    }
  }
}
