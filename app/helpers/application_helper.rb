module ApplicationHelper
 def filter
   todate = params.first || nil ;
   fromdate = params.second || nil;
   authorid = params[-2] || 'all' ;
   repositoryid = params[-1] || 'all';
    
 end

end
