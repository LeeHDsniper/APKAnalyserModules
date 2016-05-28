.class Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment$NotifyDataSetChangedAsyncTask;
.super Lcom/adobe/creativesdk/aviary/internal/os/AdobeImageAsyncTask;
.source "StoreListFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "NotifyDataSetChangedAsyncTask"
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
.field final synthetic this$0:Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment;


# direct methods
.method constructor <init>(Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment;)V
    .registers 2
    .param p1, "this$0"    # Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment;

    .prologue
    .line 930
    iput-object p1, p0, Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment$NotifyDataSetChangedAsyncTask;->this$0:Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment;

    invoke-direct {p0}, Lcom/adobe/creativesdk/aviary/internal/os/AdobeImageAsyncTask;-><init>()V

    return-void
.end method


# virtual methods
.method protected bridge synthetic doPostExecute(Ljava/lang/Object;)V
    .registers 2

    .prologue
    .line 930
    check-cast p1, Ljava/lang/Void;

    invoke-virtual {p0, p1}, Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment$NotifyDataSetChangedAsyncTask;->doPostExecute(Ljava/lang/Void;)V

    return-void
.end method

.method protected doPostExecute(Ljava/lang/Void;)V
    .registers 5
    .param p1, "aVoid"    # Ljava/lang/Void;

    .prologue
    .line 933
    sget-object v0, Lcom/adobe/creativesdk/aviary/fragments/StoreListFragmentAbstract;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v1, "NotifyDataSetChangedAsyncTask.doPostExecute"

    const/4 v2, 0x0

    new-array v2, v2, [Ljava/lang/Object;

    invoke-interface {v0, v1, v2}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->verbose(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 934
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment$NotifyDataSetChangedAsyncTask;->this$0:Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment;

    iget-object v0, v0, Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment;->adapter:Landroid/support/v4/widget/CursorAdapter;

    invoke-virtual {v0}, Landroid/support/v4/widget/CursorAdapter;->notifyDataSetChanged()V

    .line 935
    return-void
.end method
