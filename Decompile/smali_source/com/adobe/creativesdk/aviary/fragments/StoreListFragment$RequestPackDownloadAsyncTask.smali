.class Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment$RequestPackDownloadAsyncTask;
.super Lcom/adobe/creativesdk/aviary/internal/os/AdobeImageAsyncTask;
.source "StoreListFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "RequestPackDownloadAsyncTask"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/adobe/creativesdk/aviary/internal/os/AdobeImageAsyncTask",
        "<",
        "Ljava/lang/Void;",
        "Ljava/lang/Void;",
        "Ljava/lang/Void;",
        ">;"
    }
.end annotation


# instance fields
.field private final identifier:Ljava/lang/String;

.field private final packId:J

.field private final packType:Ljava/lang/String;

.field final synthetic this$0:Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment;

.field private final trackerName:Ljava/lang/String;

.field private userId:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment;JLjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .registers 8
    .param p1, "this$0"    # Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment;
    .param p2, "packId"    # J
    .param p4, "identifier"    # Ljava/lang/String;
    .param p5, "packType"    # Ljava/lang/String;
    .param p6, "trackerName"    # Ljava/lang/String;
    .param p7, "userId"    # Ljava/lang/String;

    .prologue
    .line 914
    iput-object p1, p0, Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment$RequestPackDownloadAsyncTask;->this$0:Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment;

    invoke-direct {p0}, Lcom/adobe/creativesdk/aviary/internal/os/AdobeImageAsyncTask;-><init>()V

    .line 916
    iput-wide p2, p0, Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment$RequestPackDownloadAsyncTask;->packId:J

    .line 917
    iput-object p4, p0, Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment$RequestPackDownloadAsyncTask;->identifier:Ljava/lang/String;

    .line 918
    iput-object p5, p0, Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment$RequestPackDownloadAsyncTask;->packType:Ljava/lang/String;

    .line 919
    iput-object p6, p0, Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment$RequestPackDownloadAsyncTask;->trackerName:Ljava/lang/String;

    .line 920
    iput-object p7, p0, Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment$RequestPackDownloadAsyncTask;->userId:Ljava/lang/String;

    .line 921
    return-void
.end method


# virtual methods
.method protected bridge synthetic doPostExecute(Ljava/lang/Object;)V
    .registers 2

    .prologue
    .line 906
    check-cast p1, Ljava/lang/Void;

    invoke-virtual {p0, p1}, Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment$RequestPackDownloadAsyncTask;->doPostExecute(Ljava/lang/Void;)V

    return-void
.end method

.method protected doPostExecute(Ljava/lang/Void;)V
    .registers 10
    .param p1, "aVoid"    # Ljava/lang/Void;

    .prologue
    .line 925
    sget-object v0, Lcom/adobe/creativesdk/aviary/fragments/StoreListFragmentAbstract;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v1, "RequestPackDownloadAsyncTask.doPostExecute"

    const/4 v2, 0x0

    new-array v2, v2, [Ljava/lang/Object;

    invoke-interface {v0, v1, v2}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->verbose(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 926
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment$RequestPackDownloadAsyncTask;->this$0:Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment;

    iget-wide v2, p0, Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment$RequestPackDownloadAsyncTask;->packId:J

    iget-object v4, p0, Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment$RequestPackDownloadAsyncTask;->identifier:Ljava/lang/String;

    iget-object v5, p0, Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment$RequestPackDownloadAsyncTask;->packType:Ljava/lang/String;

    iget-object v6, p0, Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment$RequestPackDownloadAsyncTask;->trackerName:Ljava/lang/String;

    const/4 v7, 0x0

    # invokes: Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment;->restorePackItem(JLjava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/adobe/creativesdk/aviary/widget/IAPBuyButton;)V
    invoke-static/range {v1 .. v7}, Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment;->access$400(Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment;JLjava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/adobe/creativesdk/aviary/widget/IAPBuyButton;)V

    .line 927
    return-void
.end method
