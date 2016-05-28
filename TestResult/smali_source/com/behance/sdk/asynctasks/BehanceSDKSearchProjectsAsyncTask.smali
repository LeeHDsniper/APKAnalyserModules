.class public Lcom/behance/sdk/asynctasks/BehanceSDKSearchProjectsAsyncTask;
.super Landroid/os/AsyncTask;
.source "BehanceSDKSearchProjectsAsyncTask.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/os/AsyncTask",
        "<",
        "Lcom/behance/sdk/asynctask/params/BehanceSDKSearchProjectsTaskParams;",
        "Ljava/lang/Void;",
        "Lcom/behance/sdk/asynctasks/result/BehanceSDKAsyncTaskResultWrapper",
        "<",
        "Ljava/util/List",
        "<",
        "Lcom/behance/sdk/dto/search/BehanceSDKProjectDTO;",
        ">;>;>;"
    }
.end annotation


# static fields
.field private static final logger:Lcom/behance/sdk/logger/ILogger;


# instance fields
.field private taskHandler:Lcom/behance/sdk/IBehanceSDKSearchProjectListener;

.field private taskParams:Lcom/behance/sdk/asynctask/params/BehanceSDKSearchProjectsTaskParams;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 55
    const-class v0, Lcom/behance/sdk/asynctasks/BehanceSDKSearchProjectsAsyncTask;

    invoke-static {v0}, Lcom/behance/sdk/logger/LoggerFactory;->getLogger(Ljava/lang/Class;)Lcom/behance/sdk/logger/ILogger;

    move-result-object v0

    sput-object v0, Lcom/behance/sdk/asynctasks/BehanceSDKSearchProjectsAsyncTask;->logger:Lcom/behance/sdk/logger/ILogger;

    return-void
.end method


# virtual methods
.method protected varargs doInBackground([Lcom/behance/sdk/asynctask/params/BehanceSDKSearchProjectsTaskParams;)Lcom/behance/sdk/asynctasks/result/BehanceSDKAsyncTaskResultWrapper;
    .registers 31
    .param p1, "params"    # [Lcom/behance/sdk/asynctask/params/BehanceSDKSearchProjectsTaskParams;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([",
            "Lcom/behance/sdk/asynctask/params/BehanceSDKSearchProjectsTaskParams;",
            ")",
            "Lcom/behance/sdk/asynctasks/result/BehanceSDKAsyncTaskResultWrapper",
            "<",
            "Ljava/util/List",
            "<",
            "Lcom/behance/sdk/dto/search/BehanceSDKProjectDTO;",
            ">;>;"
        }
    .end annotation

    .prologue
    .line 67
    new-instance v15, Lcom/behance/sdk/asynctasks/result/BehanceSDKAsyncTaskResultWrapper;

    invoke-direct {v15}, Lcom/behance/sdk/asynctasks/result/BehanceSDKAsyncTaskResultWrapper;-><init>()V

    .line 71
    .local v15, "result":Lcom/behance/sdk/asynctasks/result/BehanceSDKAsyncTaskResultWrapper;, "Lcom/behance/sdk/asynctasks/result/BehanceSDKAsyncTaskResultWrapper<Ljava/util/List<Lcom/behance/sdk/dto/search/BehanceSDKProjectDTO;>;>;"
    :try_start_5
    move-object/from16 v0, p1

    array-length v0, v0

    move/from16 v25, v0

    const/16 v26, 0x1

    move/from16 v0, v25

    move/from16 v1, v26

    if-ne v0, v1, :cond_16a

    const/16 v25, 0x0

    aget-object v25, p1, v25

    if-eqz v25, :cond_16a

    .line 73
    const/16 v25, 0x0

    aget-object v12, p1, v25

    .line 74
    .local v12, "projectParams":Lcom/behance/sdk/asynctask/params/BehanceSDKSearchProjectsTaskParams;
    move-object/from16 v0, p0

    iput-object v12, v0, Lcom/behance/sdk/asynctasks/BehanceSDKSearchProjectsAsyncTask;->taskParams:Lcom/behance/sdk/asynctask/params/BehanceSDKSearchProjectsTaskParams;

    .line 76
    new-instance v23, Ljava/util/HashMap;

    invoke-direct/range {v23 .. v23}, Ljava/util/HashMap;-><init>()V

    .line 77
    .local v23, "urlParams":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    const-string v25, "clientId"

    invoke-virtual {v12}, Lcom/behance/sdk/asynctask/params/BehanceSDKSearchProjectsTaskParams;->getClientId()Ljava/lang/String;

    move-result-object v26

    move-object/from16 v0, v23

    move-object/from16 v1, v25

    move-object/from16 v2, v26

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 78
    const-string v25, "{server_root_url}/v2/projects?{key_client_id_param}={clientId}"

    move-object/from16 v0, v25

    move-object/from16 v1, v23

    invoke-static {v0, v1}, Lcom/behance/sdk/util/BehanceSDKUrlUtil;->getUrlFromTemplate(Ljava/lang/String;Ljava/util/Map;)Ljava/lang/String;

    move-result-object v22

    .line 80
    .local v22, "url":Ljava/lang/String;
    const-string v25, "page"

    invoke-virtual {v12}, Lcom/behance/sdk/asynctask/params/BehanceSDKSearchProjectsTaskParams;->getPageNumber()I

    move-result v26

    invoke-static/range {v26 .. v26}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v26

    move-object/from16 v0, v22

    move-object/from16 v1, v25

    move-object/from16 v2, v26

    invoke-static {v0, v1, v2}, Lcom/behance/sdk/util/BehanceSDKUrlUtil;->appendQueryStringParam(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v22

    .line 81
    const-string v25, "per_page"

    invoke-virtual {v12}, Lcom/behance/sdk/asynctask/params/BehanceSDKSearchProjectsTaskParams;->getPageSize()I

    move-result v26

    invoke-static/range {v26 .. v26}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v26

    move-object/from16 v0, v22

    move-object/from16 v1, v25

    move-object/from16 v2, v26

    invoke-static {v0, v1, v2}, Lcom/behance/sdk/util/BehanceSDKUrlUtil;->appendQueryStringParam(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v22

    .line 83
    invoke-virtual {v12}, Lcom/behance/sdk/asynctask/params/BehanceSDKSearchProjectsTaskParams;->getSortOption()Lcom/behance/sdk/enums/BehanceSDKProjectsSortOption;

    move-result-object v18

    .line 84
    .local v18, "sortOption":Lcom/behance/sdk/enums/BehanceSDKProjectsSortOption;
    if-nez v18, :cond_6e

    .line 85
    sget-object v18, Lcom/behance/sdk/enums/BehanceSDKProjectsSortOption;->FEATURED_DATE:Lcom/behance/sdk/enums/BehanceSDKProjectsSortOption;

    .line 86
    :cond_6e
    const-string v25, "sort"

    invoke-virtual/range {v18 .. v18}, Lcom/behance/sdk/enums/BehanceSDKProjectsSortOption;->toString()Ljava/lang/String;

    move-result-object v26

    move-object/from16 v0, v22

    move-object/from16 v1, v25

    move-object/from16 v2, v26

    invoke-static {v0, v1, v2}, Lcom/behance/sdk/util/BehanceSDKUrlUtil;->appendQueryStringParam(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v22

    .line 89
    invoke-virtual {v12}, Lcom/behance/sdk/asynctask/params/BehanceSDKSearchProjectsTaskParams;->getTimeSpan()Lcom/behance/sdk/enums/BehanceSDKProjectsTimeSpan;

    move-result-object v21

    .line 90
    .local v21, "timeSpan":Lcom/behance/sdk/enums/BehanceSDKProjectsTimeSpan;
    if-eqz v21, :cond_94

    .line 91
    const-string v25, "time"

    invoke-virtual/range {v21 .. v21}, Lcom/behance/sdk/enums/BehanceSDKProjectsTimeSpan;->toString()Ljava/lang/String;

    move-result-object v26

    move-object/from16 v0, v22

    move-object/from16 v1, v25

    move-object/from16 v2, v26

    invoke-static {v0, v1, v2}, Lcom/behance/sdk/util/BehanceSDKUrlUtil;->appendQueryStringParam(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v22

    .line 95
    :cond_94
    invoke-virtual {v12}, Lcom/behance/sdk/asynctask/params/BehanceSDKSearchProjectsTaskParams;->getField()Ljava/lang/String;

    move-result-object v8

    .line 96
    .local v8, "field":Ljava/lang/String;
    invoke-static {v8}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v25

    if-nez v25, :cond_a8

    .line 97
    const-string v25, "field"

    move-object/from16 v0, v22

    move-object/from16 v1, v25

    invoke-static {v0, v1, v8}, Lcom/behance/sdk/util/BehanceSDKUrlUtil;->appendQueryStringParam(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v22

    .line 100
    :cond_a8
    invoke-virtual {v12}, Lcom/behance/sdk/asynctask/params/BehanceSDKSearchProjectsTaskParams;->getCountry()Ljava/lang/String;

    move-result-object v5

    .line 101
    .local v5, "country":Ljava/lang/String;
    invoke-static {v5}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v25

    if-nez v25, :cond_bc

    .line 102
    const-string v25, "country"

    move-object/from16 v0, v22

    move-object/from16 v1, v25

    invoke-static {v0, v1, v5}, Lcom/behance/sdk/util/BehanceSDKUrlUtil;->appendQueryStringParam(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v22

    .line 105
    :cond_bc
    invoke-virtual {v12}, Lcom/behance/sdk/asynctask/params/BehanceSDKSearchProjectsTaskParams;->getState()Ljava/lang/String;

    move-result-object v19

    .line 106
    .local v19, "state":Ljava/lang/String;
    invoke-static/range {v19 .. v19}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v25

    if-nez v25, :cond_de

    const-string v25, "All States"

    move-object/from16 v0, v19

    move-object/from16 v1, v25

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v25

    if-nez v25, :cond_de

    .line 107
    const-string v25, "state"

    move-object/from16 v0, v22

    move-object/from16 v1, v25

    move-object/from16 v2, v19

    invoke-static {v0, v1, v2}, Lcom/behance/sdk/util/BehanceSDKUrlUtil;->appendQueryStringParam(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v22

    .line 109
    :cond_de
    invoke-virtual {v12}, Lcom/behance/sdk/asynctask/params/BehanceSDKSearchProjectsTaskParams;->getCity()Ljava/lang/String;

    move-result-object v4

    .line 110
    .local v4, "city":Ljava/lang/String;
    invoke-static {v4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v25

    if-nez v25, :cond_fc

    const-string v25, "All Cities"

    move-object/from16 v0, v25

    invoke-virtual {v4, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v25

    if-nez v25, :cond_fc

    .line 111
    const-string v25, "city"

    move-object/from16 v0, v22

    move-object/from16 v1, v25

    invoke-static {v0, v1, v4}, Lcom/behance/sdk/util/BehanceSDKUrlUtil;->appendQueryStringParam(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v22

    .line 114
    :cond_fc
    invoke-virtual {v12}, Lcom/behance/sdk/asynctask/params/BehanceSDKSearchProjectsTaskParams;->getSearchString()Ljava/lang/String;

    move-result-object v17

    .line 115
    .local v17, "searchString":Ljava/lang/String;
    invoke-static/range {v17 .. v17}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v25

    if-nez v25, :cond_112

    .line 116
    const-string v25, "q"

    move-object/from16 v0, v22

    move-object/from16 v1, v25

    move-object/from16 v2, v17

    invoke-static {v0, v1, v2}, Lcom/behance/sdk/util/BehanceSDKUrlUtil;->appendQueryStringParam(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v22

    .line 119
    :cond_112
    invoke-static {}, Lcom/behance/sdk/managers/BehanceSDKUserManager;->getInstance()Lcom/behance/sdk/managers/BehanceSDKUserManager;

    move-result-object v16

    .line 120
    .local v16, "sdkUserManager":Lcom/behance/sdk/managers/BehanceSDKUserManager;
    invoke-virtual/range {v16 .. v16}, Lcom/behance/sdk/managers/BehanceSDKUserManager;->checkExpiryAndGetAccessToken()Ljava/lang/String;

    move-result-object v24

    .line 121
    .local v24, "userAccessToken":Ljava/lang/String;
    if-eqz v24, :cond_128

    .line 122
    const-string v25, "access_token"

    move-object/from16 v0, v22

    move-object/from16 v1, v25

    move-object/from16 v2, v24

    invoke-static {v0, v1, v2}, Lcom/behance/sdk/util/BehanceSDKUrlUtil;->appendQueryStringParam(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v22

    .line 125
    :cond_128
    sget-object v25, Lcom/behance/sdk/asynctasks/BehanceSDKSearchProjectsAsyncTask;->logger:Lcom/behance/sdk/logger/ILogger;

    const-string v26, "Get Projects async task request url - %s"

    const/16 v27, 0x1

    move/from16 v0, v27

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v27, v0

    const/16 v28, 0x0

    aput-object v22, v27, v28

    invoke-interface/range {v25 .. v27}, Lcom/behance/sdk/logger/ILogger;->debug(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 127
    new-instance v9, Lorg/apache/http/client/methods/HttpGet;

    move-object/from16 v0, v22

    invoke-direct {v9, v0}, Lorg/apache/http/client/methods/HttpGet;-><init>(Ljava/lang/String;)V

    .line 128
    .local v9, "httpGet":Lorg/apache/http/client/methods/HttpGet;
    invoke-static {v9}, Lcom/behance/sdk/util/BehanceSDKHTTPUtils;->doHTTPGet(Lorg/apache/http/client/methods/HttpGet;)Lcom/behance/sdk/util/HTTPResponse;

    move-result-object v14

    .line 129
    .local v14, "publishProjectDetailsHttpResponse":Lcom/behance/sdk/util/HTTPResponse;
    invoke-virtual {v14}, Lcom/behance/sdk/util/HTTPResponse;->getResponseString()Ljava/lang/String;

    move-result-object v10

    .line 132
    .local v10, "jsonResponseString":Ljava/lang/String;
    sget-object v25, Lcom/behance/sdk/asynctasks/BehanceSDKSearchProjectsAsyncTask;->logger:Lcom/behance/sdk/logger/ILogger;

    const-string v26, "Get projects async task response: %s"

    const/16 v27, 0x1

    move/from16 v0, v27

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v27, v0

    const/16 v28, 0x0

    aput-object v10, v27, v28

    invoke-interface/range {v25 .. v27}, Lcom/behance/sdk/logger/ILogger;->debug(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 133
    new-instance v11, Lcom/behance/sdk/dto/parser/BehanceSDKProjectDTOParser;

    invoke-direct {v11}, Lcom/behance/sdk/dto/parser/BehanceSDKProjectDTOParser;-><init>()V

    .line 134
    .local v11, "parser":Lcom/behance/sdk/dto/parser/BehanceSDKProjectDTOParser;
    invoke-virtual {v11, v10}, Lcom/behance/sdk/dto/parser/BehanceSDKProjectDTOParser;->parseProjects(Ljava/lang/String;)Ljava/util/List;

    move-result-object v13

    .line 135
    .local v13, "projectsList":Ljava/util/List;, "Ljava/util/List<Lcom/behance/sdk/dto/search/BehanceSDKProjectDTO;>;"
    invoke-virtual {v15, v13}, Lcom/behance/sdk/asynctasks/result/BehanceSDKAsyncTaskResultWrapper;->setResult(Ljava/lang/Object;)V

    .line 153
    .end local v4    # "city":Ljava/lang/String;
    .end local v5    # "country":Ljava/lang/String;
    .end local v8    # "field":Ljava/lang/String;
    .end local v9    # "httpGet":Lorg/apache/http/client/methods/HttpGet;
    .end local v10    # "jsonResponseString":Ljava/lang/String;
    .end local v11    # "parser":Lcom/behance/sdk/dto/parser/BehanceSDKProjectDTOParser;
    .end local v12    # "projectParams":Lcom/behance/sdk/asynctask/params/BehanceSDKSearchProjectsTaskParams;
    .end local v13    # "projectsList":Ljava/util/List;, "Ljava/util/List<Lcom/behance/sdk/dto/search/BehanceSDKProjectDTO;>;"
    .end local v14    # "publishProjectDetailsHttpResponse":Lcom/behance/sdk/util/HTTPResponse;
    .end local v16    # "sdkUserManager":Lcom/behance/sdk/managers/BehanceSDKUserManager;
    .end local v17    # "searchString":Ljava/lang/String;
    .end local v18    # "sortOption":Lcom/behance/sdk/enums/BehanceSDKProjectsSortOption;
    .end local v19    # "state":Ljava/lang/String;
    .end local v21    # "timeSpan":Lcom/behance/sdk/enums/BehanceSDKProjectsTimeSpan;
    .end local v22    # "url":Ljava/lang/String;
    .end local v23    # "urlParams":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    .end local v24    # "userAccessToken":Ljava/lang/String;
    :goto_169
    return-object v15

    .line 138
    :cond_16a
    const/16 v25, 0x1

    move/from16 v0, v25

    invoke-virtual {v15, v0}, Lcom/behance/sdk/asynctasks/result/BehanceSDKAsyncTaskResultWrapper;->setExceptionOccurred(Z)V

    .line 139
    new-instance v25, Lcom/behance/sdk/exception/BehanceSDKException;

    const-string v26, "BehanceSDKSearchProjectsTaskParams cannot be null"

    invoke-direct/range {v25 .. v26}, Lcom/behance/sdk/exception/BehanceSDKException;-><init>(Ljava/lang/String;)V

    move-object/from16 v0, v25

    invoke-virtual {v15, v0}, Lcom/behance/sdk/asynctasks/result/BehanceSDKAsyncTaskResultWrapper;->setException(Ljava/lang/Exception;)V
    :try_end_17d
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_17d} :catch_17e
    .catch Ljava/lang/Throwable; {:try_start_5 .. :try_end_17d} :catch_19f

    goto :goto_169

    .line 143
    :catch_17e
    move-exception v6

    .line 144
    .local v6, "e":Ljava/lang/Exception;
    sget-object v25, Lcom/behance/sdk/asynctasks/BehanceSDKSearchProjectsAsyncTask;->logger:Lcom/behance/sdk/logger/ILogger;

    const-string v26, "Problem getting Projects from server"

    const/16 v27, 0x0

    move/from16 v0, v27

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v27, v0

    move-object/from16 v0, v25

    move-object/from16 v1, v26

    move-object/from16 v2, v27

    invoke-interface {v0, v6, v1, v2}, Lcom/behance/sdk/logger/ILogger;->error(Ljava/lang/Throwable;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 145
    const/16 v25, 0x1

    move/from16 v0, v25

    invoke-virtual {v15, v0}, Lcom/behance/sdk/asynctasks/result/BehanceSDKAsyncTaskResultWrapper;->setExceptionOccurred(Z)V

    .line 146
    invoke-virtual {v15, v6}, Lcom/behance/sdk/asynctasks/result/BehanceSDKAsyncTaskResultWrapper;->setException(Ljava/lang/Exception;)V

    goto :goto_169

    .line 147
    .end local v6    # "e":Ljava/lang/Exception;
    :catch_19f
    move-exception v20

    .line 148
    .local v20, "t":Ljava/lang/Throwable;
    sget-object v25, Lcom/behance/sdk/asynctasks/BehanceSDKSearchProjectsAsyncTask;->logger:Lcom/behance/sdk/logger/ILogger;

    const-string v26, "Problem getting Projects from server"

    const/16 v27, 0x0

    move/from16 v0, v27

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v27, v0

    move-object/from16 v0, v25

    move-object/from16 v1, v20

    move-object/from16 v2, v26

    move-object/from16 v3, v27

    invoke-interface {v0, v1, v2, v3}, Lcom/behance/sdk/logger/ILogger;->error(Ljava/lang/Throwable;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 149
    new-instance v7, Lcom/behance/sdk/exception/BehanceSDKException;

    move-object/from16 v0, v20

    invoke-direct {v7, v0}, Lcom/behance/sdk/exception/BehanceSDKException;-><init>(Ljava/lang/Throwable;)V

    .line 150
    .local v7, "ex":Lcom/behance/sdk/exception/BehanceSDKException;
    invoke-virtual {v15, v7}, Lcom/behance/sdk/asynctasks/result/BehanceSDKAsyncTaskResultWrapper;->setException(Ljava/lang/Exception;)V

    .line 151
    const/16 v25, 0x1

    move/from16 v0, v25

    invoke-virtual {v15, v0}, Lcom/behance/sdk/asynctasks/result/BehanceSDKAsyncTaskResultWrapper;->setExceptionOccurred(Z)V

    goto :goto_169
.end method

.method protected bridge synthetic doInBackground([Ljava/lang/Object;)Ljava/lang/Object;
    .registers 3

    .prologue
    .line 53
    check-cast p1, [Lcom/behance/sdk/asynctask/params/BehanceSDKSearchProjectsTaskParams;

    invoke-virtual {p0, p1}, Lcom/behance/sdk/asynctasks/BehanceSDKSearchProjectsAsyncTask;->doInBackground([Lcom/behance/sdk/asynctask/params/BehanceSDKSearchProjectsTaskParams;)Lcom/behance/sdk/asynctasks/result/BehanceSDKAsyncTaskResultWrapper;

    move-result-object v0

    return-object v0
.end method

.method protected onPostExecute(Lcom/behance/sdk/asynctasks/result/BehanceSDKAsyncTaskResultWrapper;)V
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/behance/sdk/asynctasks/result/BehanceSDKAsyncTaskResultWrapper",
            "<",
            "Ljava/util/List",
            "<",
            "Lcom/behance/sdk/dto/search/BehanceSDKProjectDTO;",
            ">;>;)V"
        }
    .end annotation

    .prologue
    .line 158
    .local p1, "resultWrapper":Lcom/behance/sdk/asynctasks/result/BehanceSDKAsyncTaskResultWrapper;, "Lcom/behance/sdk/asynctasks/result/BehanceSDKAsyncTaskResultWrapper<Ljava/util/List<Lcom/behance/sdk/dto/search/BehanceSDKProjectDTO;>;>;"
    invoke-virtual {p1}, Lcom/behance/sdk/asynctasks/result/BehanceSDKAsyncTaskResultWrapper;->isExceptionOccurred()Z

    move-result v0

    if-eqz v0, :cond_10

    .line 159
    iget-object v0, p0, Lcom/behance/sdk/asynctasks/BehanceSDKSearchProjectsAsyncTask;->taskHandler:Lcom/behance/sdk/IBehanceSDKSearchProjectListener;

    invoke-virtual {p1}, Lcom/behance/sdk/asynctasks/result/BehanceSDKAsyncTaskResultWrapper;->getException()Ljava/lang/Exception;

    move-result-object v1

    invoke-interface {v0, v1}, Lcom/behance/sdk/IBehanceSDKSearchProjectListener;->onSearchProjectsFailure(Ljava/lang/Exception;)V

    .line 163
    :goto_f
    return-void

    .line 161
    :cond_10
    iget-object v1, p0, Lcom/behance/sdk/asynctasks/BehanceSDKSearchProjectsAsyncTask;->taskHandler:Lcom/behance/sdk/IBehanceSDKSearchProjectListener;

    invoke-virtual {p1}, Lcom/behance/sdk/asynctasks/result/BehanceSDKAsyncTaskResultWrapper;->getResult()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/List;

    invoke-interface {v1, v0}, Lcom/behance/sdk/IBehanceSDKSearchProjectListener;->onSearchProjectsSuccess(Ljava/util/List;)V

    goto :goto_f
.end method

.method protected bridge synthetic onPostExecute(Ljava/lang/Object;)V
    .registers 2

    .prologue
    .line 53
    check-cast p1, Lcom/behance/sdk/asynctasks/result/BehanceSDKAsyncTaskResultWrapper;

    invoke-virtual {p0, p1}, Lcom/behance/sdk/asynctasks/BehanceSDKSearchProjectsAsyncTask;->onPostExecute(Lcom/behance/sdk/asynctasks/result/BehanceSDKAsyncTaskResultWrapper;)V

    return-void
.end method
