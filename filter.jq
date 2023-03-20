.[1].roots.bookmark_bar.children[0:-1][]
| { name: .name, date_added: .date_added, date_modified: .date_modified, type: .type, guid: .guid, children: [.children[] | [{ name: .name, guid: .guid, url: .url, type: .type }][]]}
