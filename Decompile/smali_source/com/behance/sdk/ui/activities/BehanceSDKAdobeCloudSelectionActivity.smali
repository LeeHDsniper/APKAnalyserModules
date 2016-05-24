.class public Lcom/behance/sdk/ui/activities/BehanceSDKAdobeCloudSelectionActivity;
.super Landroid/support/v4/app/FragmentActivity;
.source "BehanceSDKAdobeCloudSelectionActivity.java"

# interfaces
.implements Landroid/view/View$OnClickListener;
.implements Landroid/widget/AdapterView$OnItemClickListener;
.implements Lcom/adobe/creativesdk/foundation/IAdobeGenericCompletionCallback;
.implements Lcom/adobe/creativesdk/foundation/IAdobeGenericErrorCallback;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/support/v4/app/FragmentActivity;",
        "Landroid/view/View$OnClickListener;",
        "Landroid/widget/AdapterView$OnItemClickListener;",
        "Lcom/adobe/creativesdk/foundation/IAdobeGenericCompletionCallback",
        "<",
        "Ljava/util/ArrayList",
        "<",
        "Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;",
        ">;>;",
        "Lcom/adobe/creativesdk/foundation/IAdobeGenericErrorCallback",
        "<",
        "Lcom/adobe/creativesdk/foundation/internal/utils/AdobeCSDKException;",
        ">;"
    }
.end annotation


# static fields
.field private static final logger:Lcom/behance/sdk/logger/ILogger;


# instance fields
.field private activityDestroyed:Z

.field private cloudsListView:Landroid/widget/ListView;

.field private progressSpinner:Landroid/view/View;

.field private sharedCloudManager:Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudManager;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 46
    const-class v0, Lcom/behance/sdk/ui/activities/BehanceSDKAdobeCloudSelectionActivity;

    invoke-static {v0}, Lcom/behance/sdk/logger/LoggerFactory;->getLogger(Ljava/lang/Class;)Lcom/behance/sdk/logger/ILogger;

    move-result-object v0

    sput-object v0, Lcom/behance/sdk/ui/activities/BehanceSDKAdobeCloudSelectionActivity;->logger:Lcom/behance/sdk/logger/ILogger;

    return-void
.end method

.method public constructor <init>()V
    .registers 2

    .prologue
    .line 44
    invoke-direct {p0}, Landroid/support/v4/app/FragmentActivity;-><init>()V

    .line 56
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/behance/sdk/ui/activities/BehanceSDKAdobeCloudSelectionActivity;->activityDestroyed:Z

    return-void
.end method

.method static synthetic access$000(Lcom/behance/sdk/ui/activities/BehanceSDKAdobeCloudSelectionActivity;Ljava/util/ArrayList;)V
    .registers 2
    .param p0, "x0"    # Lcom/behance/sdk/ui/activities/BehanceSDKAdobeCloudSelectionActivity;
    .param p1, "x1"    # Ljava/util/ArrayList;

    .prologue
    .line 44
    invoke-direct {p0, p1}, Lcom/behance/sdk/ui/activities/BehanceSDKAdobeCloudSelectionActivity;->setCloudListAdapter(Ljava/util/ArrayList;)V

    return-void
.end method

.method static synthetic access$100(Lcom/behance/sdk/ui/activities/BehanceSDKAdobeCloudSelectionActivity;)V
    .registers 1
    .param p0, "x0"    # Lcom/behance/sdk/ui/activities/BehanceSDKAdobeCloudSelectionActivity;

    .prologue
    .line 44
    invoke-direct {p0}, Lcom/behance/sdk/ui/activities/BehanceSDKAdobeCloudSelectionActivity;->handleCloudRetrievingError()V

    return-void
.end method

.method private closeThisView()V
    .registers 2

    .prologue
    .line 122
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/behance/sdk/ui/activities/BehanceSDKAdobeCloudSelectionActivity;->activityDestroyed:Z

    .line 123
    invoke-virtual {p0}, Lcom/behance/sdk/ui/activities/BehanceSDKAdobeCloudSelectionActivity;->finish()V

    .line 124
    return-void
.end method

.method private handleCloudOptionSelection(Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;)V
    .registers 3
    .param p1, "selectedCloud"    # Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;

    .prologue
    .line 175
    if-eqz p1, :cond_7

    .line 176
    iget-object v0, p0, Lcom/behance/sdk/ui/activities/BehanceSDKAdobeCloudSelectionActivity;->sharedCloudManager:Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudManager;

    invoke-virtual {v0, p1}, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudManager;->setDefaultCloud(Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;)V

    .line 178
    :cond_7
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/behance/sdk/ui/activities/BehanceSDKAdobeCloudSelectionActivity;->setResult(I)V

    .line 179
    invoke-direct {p0}, Lcom/behance/sdk/ui/activities/BehanceSDKAdobeCloudSelectionActivity;->closeThisView()V

    .line 180
    return-void
.end method

.method private handleCloudRetrievingError()V
    .registers 3

    .prologue
    .line 169
    sget v0, Lcom/behance/sdk/R$string;->bsdk_cloud_selection_view_loading_error_msg:I

    const/4 v1, 0x1

    invoke-static {p0, v0, v1}, Landroid/widget/Toast;->makeText(Landroid/content/Context;II)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    .line 170
    const/4 v0, 0x3

    invoke-virtual {p0, v0}, Lcom/behance/sdk/ui/activities/BehanceSDKAdobeCloudSelectionActivity;->setResult(I)V

    .line 171
    invoke-direct {p0}, Lcom/behance/sdk/ui/activities/BehanceSDKAdobeCloudSelectionActivity;->closeThisView()V

    .line 172
    return-void
.end method

.method private hideProgressSpinner()V
    .registers 3

    .prologue
    .line 96
    iget-object v0, p0, Lcom/behance/sdk/ui/activities/BehanceSDKAdobeCloudSelectionActivity;->progressSpinner:Landroid/view/View;

    if-eqz v0, :cond_11

    .line 97
    iget-object v0, p0, Lcom/behance/sdk/ui/activities/BehanceSDKAdobeCloudSelectionActivity;->cloudsListView:Landroid/widget/ListView;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/widget/ListView;->setVisibility(I)V

    .line 98
    iget-object v0, p0, Lcom/behance/sdk/ui/activities/BehanceSDKAdobeCloudSelectionActivity;->progressSpinner:Landroid/view/View;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 100
    :cond_11
    return-void
.end method

.method private loadAdobeClouds()V
    .registers 3

    .prologue
    .line 84
    invoke-direct {p0}, Lcom/behance/sdk/ui/activities/BehanceSDKAdobeCloudSelectionActivity;->showProgressSpinner()V

    .line 85
    iget-object v0, p0, Lcom/behance/sdk/ui/activities/BehanceSDKAdobeCloudSelectionActivity;->sharedCloudManager:Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudManager;

    const/4 v1, 0x0

    invoke-virtual {v0, p0, p0, v1}, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudManager;->refreshClouds(Lcom/adobe/creativesdk/foundation/IAdobeGenericCompletionCallback;Lcom/adobe/creativesdk/foundation/IAdobeGenericErrorCallback;Landroid/os/Handler;)V

    .line 86
    return-void
.end method

.method private setCloudListAdapter(Ljava/util/ArrayList;)V
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 160
    .local p1, "adobeClouds":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;>;"
    if-eqz p1, :cond_15

    .line 161
    iget-object v2, p0, Lcom/behance/sdk/ui/activities/BehanceSDKAdobeCloudSelectionActivity;->sharedCloudManager:Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudManager;

    invoke-virtual {v2}, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudManager;->getDefaultCloud()Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;

    move-result-object v0

    .line 162
    .local v0, "defaultCloud":Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;
    new-instance v1, Lcom/behance/sdk/ui/adapters/BehanceSDKAdobeCloudSelectionListItemAdapter;

    invoke-direct {v1, p0, p1, v0}, Lcom/behance/sdk/ui/adapters/BehanceSDKAdobeCloudSelectionListItemAdapter;-><init>(Landroid/content/Context;Ljava/util/List;Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;)V

    .line 163
    .local v1, "listItemArrayAdapter":Lcom/behance/sdk/ui/adapters/BehanceSDKAdobeCloudSelectionListItemAdapter;
    iget-object v2, p0, Lcom/behance/sdk/ui/activities/BehanceSDKAdobeCloudSelectionActivity;->cloudsListView:Landroid/widget/ListView;

    invoke-virtual {v2, v1}, Landroid/widget/ListView;->setAdapter(Landroid/widget/ListAdapter;)V

    .line 164
    invoke-direct {p0}, Lcom/behance/sdk/ui/activities/BehanceSDKAdobeCloudSelectionActivity;->hideProgressSpinner()V

    .line 166
    .end local v0    # "defaultCloud":Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;
    .end local v1    # "listItemArrayAdapter":Lcom/behance/sdk/ui/adapters/BehanceSDKAdobeCloudSelectionListItemAdapter;
    :cond_15
    return-void
.end method

.method private showProgressSpinner()V
    .registers 3

    .prologue
    .line 89
    iget-object v0, p0, Lcom/behance/sdk/ui/activities/BehanceSDKAdobeCloudSelectionActivity;->progressSpinner:Landroid/view/View;

    if-eqz v0, :cond_10

    .line 90
    iget-object v0, p0, Lcom/behance/sdk/ui/activities/BehanceSDKAdobeCloudSelectionActivity;->cloudsListView:Landroid/widget/ListView;

    const/4 v1, 0x4

    invoke-virtual {v0, v1}, Landroid/widget/ListView;->setVisibility(I)V

    .line 91
    iget-object v0, p0, Lcom/behance/sdk/ui/activities/BehanceSDKAdobeCloudSelectionActivity;->progressSpinner:Landroid/view/View;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 93
    :cond_10
    return-void
.end method


# virtual methods
.method public onBackPressed()V
    .registers 2

    .prologue
    .line 117
    const/4 v0, 0x2

    invoke-virtual {p0, v0}, Lcom/behance/sdk/ui/activities/BehanceSDKAdobeCloudSelectionActivity;->setResult(I)V

    .line 118
    invoke-direct {p0}, Lcom/behance/sdk/ui/activities/BehanceSDKAdobeCloudSelectionActivity;->closeThisView()V

    .line 119
    return-void
.end method

.method public onClick(Landroid/view/View;)V
    .registers 4
    .param p1, "clickedView"    # Landroid/view/View;

    .prologue
    .line 109
    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result v0

    sget v1, Lcom/behance/sdk/R$id;->bsdkCloudSelectionViewBackBtnContainer:I

    if-ne v0, v1, :cond_f

    .line 110
    const/4 v0, 0x2

    invoke-virtual {p0, v0}, Lcom/behance/sdk/ui/activities/BehanceSDKAdobeCloudSelectionActivity;->setResult(I)V

    .line 111
    invoke-direct {p0}, Lcom/behance/sdk/ui/activities/BehanceSDKAdobeCloudSelectionActivity;->closeThisView()V

    .line 113
    :cond_f
    return-void
.end method

.method public bridge synthetic onCompletion(Ljava/lang/Object;)V
    .registers 2

    .prologue
    .line 44
    check-cast p1, Ljava/util/ArrayList;

    invoke-virtual {p0, p1}, Lcom/behance/sdk/ui/activities/BehanceSDKAdobeCloudSelectionActivity;->onCompletion(Ljava/util/ArrayList;)V

    return-void
.end method

.method public onCompletion(Ljava/util/ArrayList;)V
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 128
    .local p1, "adobeClouds":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;>;"
    iget-boolean v0, p0, Lcom/behance/sdk/ui/activities/BehanceSDKAdobeCloudSelectionActivity;->activityDestroyed:Z

    if-nez v0, :cond_14

    .line 129
    if-eqz p1, :cond_15

    .line 130
    iget-object v0, p0, Lcom/behance/sdk/ui/activities/BehanceSDKAdobeCloudSelectionActivity;->cloudsListView:Landroid/widget/ListView;

    if-eqz v0, :cond_14

    .line 131
    iget-object v0, p0, Lcom/behance/sdk/ui/activities/BehanceSDKAdobeCloudSelectionActivity;->cloudsListView:Landroid/widget/ListView;

    new-instance v1, Lcom/behance/sdk/ui/activities/BehanceSDKAdobeCloudSelectionActivity$1;

    invoke-direct {v1, p0, p1}, Lcom/behance/sdk/ui/activities/BehanceSDKAdobeCloudSelectionActivity$1;-><init>(Lcom/behance/sdk/ui/activities/BehanceSDKAdobeCloudSelectionActivity;Ljava/util/ArrayList;)V

    invoke-virtual {v0, v1}, Landroid/widget/ListView;->post(Ljava/lang/Runnable;)Z

    .line 142
    :cond_14
    :goto_14
    return-void

    .line 139
    :cond_15
    invoke-direct {p0}, Lcom/behance/sdk/ui/activities/BehanceSDKAdobeCloudSelectionActivity;->handleCloudRetrievingError()V

    goto :goto_14
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .registers 4
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 60
    invoke-super {p0, p1}, Landroid/support/v4/app/FragmentActivity;->onCreate(Landroid/os/Bundle;)V

    .line 62
    const/4 v1, 0x0

    iput-boolean v1, p0, Lcom/behance/sdk/ui/activities/BehanceSDKAdobeCloudSelectionActivity;->activityDestroyed:Z

    .line 64
    sget v1, Lcom/behance/sdk/R$layout;->bsdk_activity_adobe_cloud_selection:I

    invoke-virtual {p0, v1}, Lcom/behance/sdk/ui/activities/BehanceSDKAdobeCloudSelectionActivity;->setContentView(I)V

    .line 66
    invoke-static {}, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudManager;->getSharedCloudManager()Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudManager;

    move-result-object v1

    iput-object v1, p0, Lcom/behance/sdk/ui/activities/BehanceSDKAdobeCloudSelectionActivity;->sharedCloudManager:Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudManager;

    .line 68
    sget v1, Lcom/behance/sdk/R$id;->bsdkCloudSelectionViewBackBtnContainer:I

    invoke-virtual {p0, v1}, Lcom/behance/sdk/ui/activities/BehanceSDKAdobeCloudSelectionActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    .line 69
    .local v0, "closeViewBtn":Landroid/view/View;
    invoke-virtual {v0, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 71
    sget v1, Lcom/behance/sdk/R$id;->bsdkCloudSelectionViewCloudsListView:I

    invoke-virtual {p0, v1}, Lcom/behance/sdk/ui/activities/BehanceSDKAdobeCloudSelectionActivity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/ListView;

    iput-object v1, p0, Lcom/behance/sdk/ui/activities/BehanceSDKAdobeCloudSelectionActivity;->cloudsListView:Landroid/widget/ListView;

    .line 72
    iget-object v1, p0, Lcom/behance/sdk/ui/activities/BehanceSDKAdobeCloudSelectionActivity;->cloudsListView:Landroid/widget/ListView;

    invoke-virtual {v1, p0}, Landroid/widget/ListView;->setOnItemClickListener(Landroid/widget/AdapterView$OnItemClickListener;)V

    .line 74
    sget v1, Lcom/behance/sdk/R$id;->bsdkCloudSelectionViewProgressSpinner:I

    invoke-virtual {p0, v1}, Lcom/behance/sdk/ui/activities/BehanceSDKAdobeCloudSelectionActivity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    iput-object v1, p0, Lcom/behance/sdk/ui/activities/BehanceSDKAdobeCloudSelectionActivity;->progressSpinner:Landroid/view/View;

    .line 75
    return-void
.end method

.method public onError(Lcom/adobe/creativesdk/foundation/internal/utils/AdobeCSDKException;)V
    .registers 5
    .param p1, "e"    # Lcom/adobe/creativesdk/foundation/internal/utils/AdobeCSDKException;

    .prologue
    .line 146
    sget-object v0, Lcom/behance/sdk/ui/activities/BehanceSDKAdobeCloudSelectionActivity;->logger:Lcom/behance/sdk/logger/ILogger;

    const-string v1, "Problem retrieving Clouds"

    const/4 v2, 0x0

    new-array v2, v2, [Ljava/lang/Object;

    invoke-interface {v0, p1, v1, v2}, Lcom/behance/sdk/logger/ILogger;->error(Ljava/lang/Throwable;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 147
    iget-boolean v0, p0, Lcom/behance/sdk/ui/activities/BehanceSDKAdobeCloudSelectionActivity;->activityDestroyed:Z

    if-nez v0, :cond_1c

    .line 148
    iget-object v0, p0, Lcom/behance/sdk/ui/activities/BehanceSDKAdobeCloudSelectionActivity;->cloudsListView:Landroid/widget/ListView;

    if-eqz v0, :cond_1c

    .line 149
    iget-object v0, p0, Lcom/behance/sdk/ui/activities/BehanceSDKAdobeCloudSelectionActivity;->cloudsListView:Landroid/widget/ListView;

    new-instance v1, Lcom/behance/sdk/ui/activities/BehanceSDKAdobeCloudSelectionActivity$2;

    invoke-direct {v1, p0}, Lcom/behance/sdk/ui/activities/BehanceSDKAdobeCloudSelectionActivity$2;-><init>(Lcom/behance/sdk/ui/activities/BehanceSDKAdobeCloudSelectionActivity;)V

    invoke-virtual {v0, v1}, Landroid/widget/ListView;->post(Ljava/lang/Runnable;)Z

    .line 157
    :cond_1c
    return-void
.end method

.method public bridge synthetic onError(Ljava/lang/Object;)V
    .registers 2

    .prologue
    .line 44
    check-cast p1, Lcom/adobe/creativesdk/foundation/internal/utils/AdobeCSDKException;

    invoke-virtual {p0, p1}, Lcom/behance/sdk/ui/activities/BehanceSDKAdobeCloudSelectionActivity;->onError(Lcom/adobe/creativesdk/foundation/internal/utils/AdobeCSDKException;)V

    return-void
.end method

.method public onItemClick(Landroid/widget/AdapterView;Landroid/view/View;IJ)V
    .registers 8
    .param p2, "view"    # Landroid/view/View;
    .param p3, "position"    # I
    .param p4, "id"    # J
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/widget/AdapterView",
            "<*>;",
            "Landroid/view/View;",
            "IJ)V"
        }
    .end annotation

    .prologue
    .line 184
    .local p1, "parent":Landroid/widget/AdapterView;, "Landroid/widget/AdapterView<*>;"
    iget-object v1, p0, Lcom/behance/sdk/ui/activities/BehanceSDKAdobeCloudSelectionActivity;->cloudsListView:Landroid/widget/ListView;

    invoke-virtual {v1, p3}, Landroid/widget/ListView;->getItemAtPosition(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;

    .line 185
    .local v0, "selectedCloud":Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;
    invoke-direct {p0, v0}, Lcom/behance/sdk/ui/activities/BehanceSDKAdobeCloudSelectionActivity;->handleCloudOptionSelection(Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;)V

    .line 186
    return-void
.end method

.method protected onResume()V
    .registers 1

    .prologue
    .line 79
    invoke-super {p0}, Landroid/support/v4/app/FragmentActivity;->onResume()V

    .line 80
    invoke-direct {p0}, Lcom/behance/sdk/ui/activities/BehanceSDKAdobeCloudSelectionActivity;->loadAdobeClouds()V

    .line 81
    return-void
.end method

.method public onSaveInstanceState(Landroid/os/Bundle;)V
    .registers 2
    .param p1, "arg0"    # Landroid/os/Bundle;

    .prologue
    .line 104
    invoke-super {p0, p1}, Landroid/support/v4/app/FragmentActivity;->onSaveInstanceState(Landroid/os/Bundle;)V

    .line 105
    return-void
.end method
