.class public Lcom/adobe/creativesdk/aviary/async_tasks/ToolsLoaderAsyncTask;
.super Lcom/adobe/creativesdk/aviary/internal/os/AdobeImageAsyncTask;
.source "ToolsLoaderAsyncTask.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/adobe/creativesdk/aviary/async_tasks/ToolsLoaderAsyncTask$ToolLoadResult;,
        Lcom/adobe/creativesdk/aviary/async_tasks/ToolsLoaderAsyncTask$ToolsLoadedEvent;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/adobe/creativesdk/aviary/internal/os/AdobeImageAsyncTask",
        "<",
        "Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity;",
        "Ljava/lang/Void;",
        "Lcom/adobe/creativesdk/aviary/async_tasks/ToolsLoaderAsyncTask$ToolLoadResult;",
        ">;"
    }
.end annotation


# instance fields
.field private final mToolList:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ljava/util/List;)V
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 50
    .local p1, "toolList":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    invoke-direct {p0}, Lcom/adobe/creativesdk/aviary/internal/os/AdobeImageAsyncTask;-><init>()V

    .line 51
    iput-object p1, p0, Lcom/adobe/creativesdk/aviary/async_tasks/ToolsLoaderAsyncTask;->mToolList:Ljava/util/List;

    .line 52
    return-void
.end method


# virtual methods
.method protected varargs doInBackground([Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity;)Lcom/adobe/creativesdk/aviary/async_tasks/ToolsLoaderAsyncTask$ToolLoadResult;
    .registers 8
    .param p1, "params"    # [Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity;

    .prologue
    const/4 v5, 0x0

    .line 56
    aget-object v0, p1, v5

    .line 57
    .local v0, "activity":Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity;
    if-nez v0, :cond_7

    .line 58
    const/4 v2, 0x0

    .line 68
    :goto_6
    return-object v2

    .line 61
    :cond_7
    iget-object v4, p0, Lcom/adobe/creativesdk/aviary/async_tasks/ToolsLoaderAsyncTask;->mToolList:Ljava/util/List;

    invoke-virtual {p0, v0, v4}, Lcom/adobe/creativesdk/aviary/async_tasks/ToolsLoaderAsyncTask;->loadTools(Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity;Ljava/util/List;)Landroid/util/Pair;

    move-result-object v3

    .line 62
    .local v3, "tools":Landroid/util/Pair;, "Landroid/util/Pair<Ljava/util/List<Ljava/lang/String;>;Ljava/util/List<Lcom/adobe/creativesdk/aviary/internal/content/ToolEntry;>;>;"
    invoke-static {v0}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils;->getPermissions(Landroid/content/Context;)Ljava/util/List;

    move-result-object v1

    .line 64
    .local v1, "permissions":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    new-instance v2, Lcom/adobe/creativesdk/aviary/async_tasks/ToolsLoaderAsyncTask$ToolLoadResult;

    invoke-direct {v2}, Lcom/adobe/creativesdk/aviary/async_tasks/ToolsLoaderAsyncTask$ToolLoadResult;-><init>()V

    .line 65
    .local v2, "result":Lcom/adobe/creativesdk/aviary/async_tasks/ToolsLoaderAsyncTask$ToolLoadResult;
    iget-object v4, v3, Landroid/util/Pair;->first:Ljava/lang/Object;

    check-cast v4, Ljava/util/List;

    iput-object v4, v2, Lcom/adobe/creativesdk/aviary/async_tasks/ToolsLoaderAsyncTask$ToolLoadResult;->tools:Ljava/util/List;

    .line 66
    iget-object v4, v3, Landroid/util/Pair;->second:Ljava/lang/Object;

    check-cast v4, Ljava/util/List;

    iput-object v4, v2, Lcom/adobe/creativesdk/aviary/async_tasks/ToolsLoaderAsyncTask$ToolLoadResult;->entries:Ljava/util/List;

    .line 67
    if-eqz v1, :cond_34

    sget-object v4, Lcom/adobe/creativesdk/aviary/internal/cds/Cds$Permission;->whitelabel:Lcom/adobe/creativesdk/aviary/internal/cds/Cds$Permission;

    invoke-virtual {v4}, Lcom/adobe/creativesdk/aviary/internal/cds/Cds$Permission;->name()Ljava/lang/String;

    move-result-object v4

    invoke-interface {v1, v4}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_34

    const/4 v4, 0x1

    :goto_31
    iput-boolean v4, v2, Lcom/adobe/creativesdk/aviary/async_tasks/ToolsLoaderAsyncTask$ToolLoadResult;->whiteLabel:Z

    goto :goto_6

    :cond_34
    move v4, v5

    goto :goto_31
.end method

.method protected bridge synthetic doInBackground([Ljava/lang/Object;)Ljava/lang/Object;
    .registers 3

    .prologue
    .line 26
    check-cast p1, [Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity;

    invoke-virtual {p0, p1}, Lcom/adobe/creativesdk/aviary/async_tasks/ToolsLoaderAsyncTask;->doInBackground([Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity;)Lcom/adobe/creativesdk/aviary/async_tasks/ToolsLoaderAsyncTask$ToolLoadResult;

    move-result-object v0

    return-object v0
.end method

.method protected doPostExecute(Lcom/adobe/creativesdk/aviary/async_tasks/ToolsLoaderAsyncTask$ToolLoadResult;)V
    .registers 7
    .param p1, "toolLoadResult"    # Lcom/adobe/creativesdk/aviary/async_tasks/ToolsLoaderAsyncTask$ToolLoadResult;

    .prologue
    .line 76
    if-eqz p1, :cond_14

    .line 77
    invoke-static {}, Lcom/adobe/creativesdk/aviary/utils/EventBusUtils;->getInstance()Lde/greenrobot/event/EventBus;

    move-result-object v0

    new-instance v1, Lcom/adobe/creativesdk/aviary/async_tasks/ToolsLoaderAsyncTask$ToolsLoadedEvent;

    iget-object v2, p1, Lcom/adobe/creativesdk/aviary/async_tasks/ToolsLoaderAsyncTask$ToolLoadResult;->tools:Ljava/util/List;

    iget-object v3, p1, Lcom/adobe/creativesdk/aviary/async_tasks/ToolsLoaderAsyncTask$ToolLoadResult;->entries:Ljava/util/List;

    iget-boolean v4, p1, Lcom/adobe/creativesdk/aviary/async_tasks/ToolsLoaderAsyncTask$ToolLoadResult;->whiteLabel:Z

    invoke-direct {v1, v2, v3, v4}, Lcom/adobe/creativesdk/aviary/async_tasks/ToolsLoaderAsyncTask$ToolsLoadedEvent;-><init>(Ljava/util/List;Ljava/util/List;Z)V

    .line 78
    invoke-virtual {v0, v1}, Lde/greenrobot/event/EventBus;->post(Ljava/lang/Object;)V

    .line 80
    :cond_14
    return-void
.end method

.method protected bridge synthetic doPostExecute(Ljava/lang/Object;)V
    .registers 2

    .prologue
    .line 26
    check-cast p1, Lcom/adobe/creativesdk/aviary/async_tasks/ToolsLoaderAsyncTask$ToolLoadResult;

    invoke-virtual {p0, p1}, Lcom/adobe/creativesdk/aviary/async_tasks/ToolsLoaderAsyncTask;->doPostExecute(Lcom/adobe/creativesdk/aviary/async_tasks/ToolsLoaderAsyncTask$ToolLoadResult;)V

    return-void
.end method

.method protected doPreExecute()V
    .registers 1

    .prologue
    .line 72
    return-void
.end method

.method public loadStandaloneTools(Landroid/content/Context;)Ljava/util/List;
    .registers 4
    .param p1, "context"    # Landroid/content/Context;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            ")",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 83
    invoke-static {p1}, Lcom/adobe/creativesdk/aviary/utils/SharedPreferencesUtils;->getInstance(Landroid/content/Context;)Lcom/adobe/creativesdk/aviary/utils/SharedPreferencesUtils;

    move-result-object v1

    invoke-virtual {v1}, Lcom/adobe/creativesdk/aviary/utils/SharedPreferencesUtils;->getToolList()[Ljava/lang/String;

    move-result-object v0

    .line 84
    .local v0, "list":[Ljava/lang/String;
    if-eqz v0, :cond_f

    .line 85
    invoke-static {v0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v1

    .line 87
    :goto_e
    return-object v1

    :cond_f
    const/4 v1, 0x0

    goto :goto_e
.end method

.method loadTools(Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity;Ljava/util/List;)Landroid/util/Pair;
    .registers 12
    .param p1, "activity"    # Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity;",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;)",
            "Landroid/util/Pair",
            "<",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;",
            "Ljava/util/List",
            "<",
            "Lcom/adobe/creativesdk/aviary/internal/content/ToolEntry;",
            ">;>;"
        }
    .end annotation

    .prologue
    .line 91
    .local p2, "currentList":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    if-nez p2, :cond_10

    .line 92
    invoke-virtual {p0, p1}, Lcom/adobe/creativesdk/aviary/async_tasks/ToolsLoaderAsyncTask;->loadStandaloneTools(Landroid/content/Context;)Ljava/util/List;

    move-result-object p2

    .line 94
    if-nez p2, :cond_10

    .line 95
    invoke-static {}, Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory;->getDefaultTools()[Ljava/lang/String;

    move-result-object v6

    invoke-static {v6}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object p2

    .line 99
    :cond_10
    new-instance v4, Ljava/util/ArrayList;

    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    .line 100
    .local v4, "listEntries":Ljava/util/List;, "Ljava/util/List<Lcom/adobe/creativesdk/aviary/internal/content/ToolEntry;>;"
    new-instance v2, Ljava/util/HashMap;

    invoke-direct {v2}, Ljava/util/HashMap;-><init>()V

    .line 101
    .local v2, "entryMap":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Lcom/adobe/creativesdk/aviary/internal/content/ToolEntry;>;"
    invoke-static {}, Lcom/adobe/creativesdk/aviary/panels/AbstractPanelLoaderService;->getToolsEntries()[Lcom/adobe/creativesdk/aviary/internal/content/ToolEntry;

    move-result-object v0

    .line 103
    .local v0, "allEntries":[Lcom/adobe/creativesdk/aviary/internal/content/ToolEntry;
    array-length v7, v0

    const/4 v6, 0x0

    :goto_20
    if-ge v6, v7, :cond_3d

    aget-object v1, v0, v6

    .line 104
    .local v1, "allEntry":Lcom/adobe/creativesdk/aviary/internal/content/ToolEntry;
    iget-object v3, v1, Lcom/adobe/creativesdk/aviary/internal/content/ToolEntry;->name:Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;

    .line 105
    .local v3, "entryName":Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;
    if-eqz p2, :cond_35

    invoke-virtual {v3}, Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;->name()Ljava/lang/String;

    move-result-object v8

    invoke-interface {p2, v8}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v8

    if-nez v8, :cond_35

    .line 103
    :goto_32
    add-int/lit8 v6, v6, 0x1

    goto :goto_20

    .line 108
    :cond_35
    invoke-virtual {v3}, Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;->name()Ljava/lang/String;

    move-result-object v8

    invoke-interface {v2, v8, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_32

    .line 111
    .end local v1    # "allEntry":Lcom/adobe/creativesdk/aviary/internal/content/ToolEntry;
    .end local v3    # "entryName":Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;
    :cond_3d
    if-eqz p2, :cond_5d

    .line 112
    invoke-interface {p2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v6

    :cond_43
    :goto_43
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_5d

    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    .line 113
    .local v5, "toolName":Ljava/lang/String;
    invoke-interface {v2, v5}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_43

    .line 116
    invoke-interface {v2, v5}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v7

    invoke-interface {v4, v7}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_43

    .line 120
    .end local v5    # "toolName":Ljava/lang/String;
    :cond_5d
    new-instance v6, Landroid/util/Pair;

    invoke-direct {v6, p2, v4}, Landroid/util/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    return-object v6
.end method
