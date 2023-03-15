async function healthcheck(r) {
    r.headersOut['Content-Type'] = "text/plain; charset=utf-8";
    if (!r.variables['healthcheck_list']){
        r.return(400, "Undefined healthcheck_list!\n");
        return;
    }
    let check_array = r.variables['healthcheck_list'].split(",");
    let results = await Promise.all(check_array.map(uri => r.subrequest(uri)));
    let sub_statuses = results.map(function(reply){
        let test_body = false;
        try{
            test_body = (JSON.parse(reply.responseBody)||{}).status == 'UP';
        }catch(e){}
        return {
            uri:  reply.uri,
            status: reply.status,
            test_body: test_body,
        }
    });
    var common_status = sub_statuses.reduce(
        (previus, i) => previus && (200 <= i.status && i.status < 400)
        , true
    ) ? 200 : 503;
    r.return(common_status, JSON.stringify({
        status:common_status,
        substatuses:sub_statuses
    }, null, 2) + "\n");
}
export default {healthcheck};
