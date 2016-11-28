
//将JRViewController类中的- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section方法替换掉
defineClass('TWJSPathViewController', {
            tableView_numberOfRowsInSection: function(tableView, section) {
            return 10;
            },
            });
