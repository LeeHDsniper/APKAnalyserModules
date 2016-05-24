.class Lcom/localytics/android/AmpSessionHandler$3;
.super Lcom/localytics/android/AmpCallable;
.source "AmpSessionHandler.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/localytics/android/AmpSessionHandler;->showAmpTest()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/localytics/android/AmpSessionHandler;

.field final synthetic val$adapter:Lcom/localytics/android/AmpRulesAdapter;

.field final synthetic val$listView:Lcom/localytics/android/TestModeListView;


# direct methods
.method constructor <init>(Lcom/localytics/android/AmpSessionHandler;Lcom/localytics/android/AmpRulesAdapter;Lcom/localytics/android/TestModeListView;)V
    .registers 4

    .prologue
    .line 338
    iput-object p1, p0, Lcom/localytics/android/AmpSessionHandler$3;->this$0:Lcom/localytics/android/AmpSessionHandler;

    iput-object p2, p0, Lcom/localytics/android/AmpSessionHandler$3;->val$adapter:Lcom/localytics/android/AmpRulesAdapter;

    iput-object p3, p0, Lcom/localytics/android/AmpSessionHandler$3;->val$listView:Lcom/localytics/android/TestModeListView;

    invoke-direct {p0}, Lcom/localytics/android/AmpCallable;-><init>()V

    return-void
.end method


# virtual methods
.method call([Ljava/lang/Object;)Ljava/lang/Object;
    .registers 5
    .param p1, "params"    # [Ljava/lang/Object;

    .prologue
    .line 342
    iget-object v0, p0, Lcom/localytics/android/AmpSessionHandler$3;->val$adapter:Lcom/localytics/android/AmpRulesAdapter;

    iget-object v1, p0, Lcom/localytics/android/AmpSessionHandler$3;->this$0:Lcom/localytics/android/AmpSessionHandler;

    iget-object v1, v1, Lcom/localytics/android/AmpSessionHandler;->mProvider:Lcom/localytics/android/LocalyticsProvider;

    invoke-virtual {v0, v1}, Lcom/localytics/android/AmpRulesAdapter;->updateDataSet(Lcom/localytics/android/LocalyticsProvider;)Z

    .line 343
    iget-object v0, p0, Lcom/localytics/android/AmpSessionHandler$3;->val$listView:Lcom/localytics/android/TestModeListView;

    iget-object v1, p0, Lcom/localytics/android/AmpSessionHandler$3;->this$0:Lcom/localytics/android/AmpSessionHandler;

    # getter for: Lcom/localytics/android/AmpSessionHandler;->mFragmentManager:Landroid/support/v4/app/FragmentManager;
    invoke-static {v1}, Lcom/localytics/android/AmpSessionHandler;->access$000(Lcom/localytics/android/AmpSessionHandler;)Landroid/support/v4/app/FragmentManager;

    move-result-object v1

    const-string v2, "amp_test_mode_list"

    invoke-virtual {v0, v1, v2}, Lcom/localytics/android/TestModeListView;->show(Landroid/support/v4/app/FragmentManager;Ljava/lang/String;)V

    .line 344
    iget-object v0, p0, Lcom/localytics/android/AmpSessionHandler$3;->this$0:Lcom/localytics/android/AmpSessionHandler;

    # getter for: Lcom/localytics/android/AmpSessionHandler;->mFragmentManager:Landroid/support/v4/app/FragmentManager;
    invoke-static {v0}, Lcom/localytics/android/AmpSessionHandler;->access$000(Lcom/localytics/android/AmpSessionHandler;)Landroid/support/v4/app/FragmentManager;

    move-result-object v0

    invoke-virtual {v0}, Landroid/support/v4/app/FragmentManager;->executePendingTransactions()Z

    .line 345
    const/4 v0, 0x0

    return-object v0
.end method
