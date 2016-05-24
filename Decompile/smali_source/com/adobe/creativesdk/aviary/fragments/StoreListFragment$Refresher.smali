.class Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment$Refresher;
.super Lrx/Subscriber;
.source "StoreListFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "Refresher"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lrx/Subscriber",
        "<",
        "Ljava/util/Map",
        "<",
        "Ljava/lang/Long;",
        "Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils$PackOptionWithPrice;",
        ">;>;"
    }
.end annotation


# instance fields
.field private mCursor:Landroid/database/Cursor;

.field final packType:Lcom/adobe/creativesdk/aviary/internal/cds/Cds$PackType;

.field private priceMap:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/Long;",
            "Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils$PackOptionWithPrice;",
            ">;"
        }
    .end annotation
.end field

.field private t1:J

.field final synthetic this$0:Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment;


# direct methods
.method constructor <init>(Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment;Lcom/adobe/creativesdk/aviary/internal/cds/Cds$PackType;)V
    .registers 3
    .param p1, "this$0"    # Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment;
    .param p2, "packType"    # Lcom/adobe/creativesdk/aviary/internal/cds/Cds$PackType;

    .prologue
    .line 765
    iput-object p1, p0, Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment$Refresher;->this$0:Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment;

    invoke-direct {p0}, Lrx/Subscriber;-><init>()V

    .line 766
    iput-object p2, p0, Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment$Refresher;->packType:Lcom/adobe/creativesdk/aviary/internal/cds/Cds$PackType;

    .line 767
    return-void
.end method

.method static synthetic access$200(Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment$Refresher;Landroid/database/Cursor;)Lrx/Observable;
    .registers 3
    .param p0, "x0"    # Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment$Refresher;
    .param p1, "x1"    # Landroid/database/Cursor;

    .prologue
    .line 759
    invoke-direct {p0, p1}, Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment$Refresher;->generatePurchaseMap(Landroid/database/Cursor;)Lrx/Observable;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$302(Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment$Refresher;Landroid/database/Cursor;)Landroid/database/Cursor;
    .registers 2
    .param p0, "x0"    # Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment$Refresher;
    .param p1, "x1"    # Landroid/database/Cursor;

    .prologue
    .line 759
    iput-object p1, p0, Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment$Refresher;->mCursor:Landroid/database/Cursor;

    return-object p1
.end method

.method private generatePurchaseMap(Landroid/database/Cursor;)Lrx/Observable;
    .registers 4
    .param p1, "cursor"    # Landroid/database/Cursor;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/database/Cursor;",
            ")",
            "Lrx/Observable",
            "<",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/Long;",
            "Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils$PackOptionWithPrice;",
            ">;>;"
        }
    .end annotation

    .prologue
    .line 808
    new-instance v0, Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment$Refresher$4;

    invoke-direct {v0, p0, p1}, Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment$Refresher$4;-><init>(Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment$Refresher;Landroid/database/Cursor;)V

    invoke-static {v0}, Lrx/Observable;->create(Lrx/Observable$OnSubscribe;)Lrx/Observable;

    move-result-object v0

    new-instance v1, Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment$Refresher$3;

    invoke-direct {v1, p0}, Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment$Refresher$3;-><init>(Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment$Refresher;)V

    .line 829
    invoke-virtual {v0, v1}, Lrx/Observable;->concatMap(Lrx/functions/Func1;)Lrx/Observable;

    move-result-object v0

    return-object v0
.end method

.method private loadCursor()Lrx/Observable;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/Observable",
            "<",
            "Landroid/database/Cursor;",
            ">;"
        }
    .end annotation

    .prologue
    .line 790
    new-instance v0, Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment$Refresher$2;

    invoke-direct {v0, p0}, Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment$Refresher$2;-><init>(Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment$Refresher;)V

    invoke-static {v0}, Lrx/Observable;->create(Lrx/Observable$OnSubscribe;)Lrx/Observable;

    move-result-object v0

    return-object v0
.end method


# virtual methods
.method public execute()Lrx/Subscriber;
    .registers 4

    .prologue
    .line 770
    sget-object v0, Lcom/adobe/creativesdk/aviary/fragments/StoreListFragmentAbstract;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v1, "Refresher::execute"

    invoke-interface {v0, v1}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->info(Ljava/lang/String;)V

    .line 772
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment$Refresher;->t1:J

    .line 774
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment$Refresher;->this$0:Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment;

    .line 775
    invoke-direct {p0}, Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment$Refresher;->loadCursor()Lrx/Observable;

    move-result-object v1

    new-instance v2, Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment$Refresher$1;

    invoke-direct {v2, p0}, Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment$Refresher$1;-><init>(Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment$Refresher;)V

    .line 776
    invoke-virtual {v1, v2}, Lrx/Observable;->concatMap(Lrx/functions/Func1;)Lrx/Observable;

    move-result-object v1

    .line 774
    invoke-static {v0, v1}, Lrx/android/app/AppObservable;->bindSupportFragment(Landroid/support/v4/app/Fragment;Lrx/Observable;)Lrx/Observable;

    move-result-object v0

    .line 783
    invoke-static {}, Lrx/schedulers/Schedulers;->computation()Lrx/Scheduler;

    move-result-object v1

    invoke-virtual {v0, v1}, Lrx/Observable;->subscribeOn(Lrx/Scheduler;)Lrx/Observable;

    move-result-object v0

    .line 784
    invoke-virtual {v0, p0}, Lrx/Observable;->subscribe(Lrx/Subscriber;)Lrx/Subscription;

    .line 786
    return-object p0
.end method

.method public onCompleted()V
    .registers 11

    .prologue
    const/4 v9, 0x1

    const/4 v8, 0x0

    .line 843
    sget-object v0, Lcom/adobe/creativesdk/aviary/fragments/StoreListFragmentAbstract;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v1, "Refresher.onCompleted(%s) in: %d"

    const/4 v2, 0x2

    new-array v2, v2, [Ljava/lang/Object;

    iget-object v3, p0, Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment$Refresher;->this$0:Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment;

    invoke-virtual {v3}, Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment;->getPackType()Lcom/adobe/creativesdk/aviary/internal/cds/Cds$PackType;

    move-result-object v3

    aput-object v3, v2, v8

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v4

    iget-wide v6, p0, Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment$Refresher;->t1:J

    sub-long/2addr v4, v6

    invoke-static {v4, v5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v3

    aput-object v3, v2, v9

    invoke-interface {v0, v1, v2}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->info(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 845
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment$Refresher;->this$0:Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment;

    invoke-virtual {v0}, Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v0

    if-eqz v0, :cond_31

    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment$Refresher;->this$0:Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment;

    invoke-virtual {v0}, Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment;->getView()Landroid/view/View;

    move-result-object v0

    if-nez v0, :cond_32

    .line 866
    :cond_31
    :goto_31
    return-void

    .line 849
    :cond_32
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment$Refresher;->this$0:Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment;

    # getter for: Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment;->packOptionMap:Ljava/util/HashMap;
    invoke-static {v0}, Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment;->access$100(Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment;)Ljava/util/HashMap;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/HashMap;->clear()V

    .line 850
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment$Refresher;->this$0:Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment;

    # getter for: Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment;->packOptionMap:Ljava/util/HashMap;
    invoke-static {v0}, Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment;->access$100(Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment;)Ljava/util/HashMap;

    move-result-object v0

    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment$Refresher;->priceMap:Ljava/util/Map;

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->putAll(Ljava/util/Map;)V

    .line 852
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment$Refresher;->this$0:Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment;

    iget-object v0, v0, Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment;->adapter:Landroid/support/v4/widget/CursorAdapter;

    invoke-virtual {v0}, Landroid/support/v4/widget/CursorAdapter;->getCursor()Landroid/database/Cursor;

    move-result-object v0

    if-eqz v0, :cond_b9

    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment$Refresher;->this$0:Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment;

    iget-object v0, v0, Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment;->adapter:Landroid/support/v4/widget/CursorAdapter;

    invoke-virtual {v0}, Landroid/support/v4/widget/CursorAdapter;->getCursor()Landroid/database/Cursor;

    move-result-object v0

    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment$Refresher;->mCursor:Landroid/database/Cursor;

    invoke-virtual {v0, v1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_b9

    .line 853
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment$Refresher;->this$0:Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment;

    iget-object v0, v0, Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment;->adapter:Landroid/support/v4/widget/CursorAdapter;

    invoke-virtual {v0}, Landroid/support/v4/widget/CursorAdapter;->notifyDataSetInvalidated()V

    .line 857
    :goto_67
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment$Refresher;->this$0:Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment;

    invoke-virtual {v0, v9}, Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment;->setListShown(Z)V

    .line 858
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment$Refresher;->mCursor:Landroid/database/Cursor;

    .line 860
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment$Refresher;->this$0:Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment;

    iget-boolean v0, v0, Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment;->firstTime:Z

    if-eqz v0, :cond_31

    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment$Refresher;->this$0:Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment;

    invoke-virtual {v0}, Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v0

    const-string v1, "autoSelectFirst"

    invoke-virtual {v0, v1, v8}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    if-eqz v0, :cond_31

    .line 861
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment$Refresher;->this$0:Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment;

    iput-boolean v8, v0, Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment;->firstTime:Z

    .line 862
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment$Refresher;->this$0:Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment;

    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment$Refresher;->this$0:Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment;

    invoke-virtual {v1}, Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v1

    const-string v2, "selectedPackId"

    iget-object v3, p0, Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment$Refresher;->this$0:Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment;

    iget-wide v4, v3, Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment;->autoSelectedPackId:J

    invoke-virtual {v1, v2, v4, v5}, Landroid/os/Bundle;->getLong(Ljava/lang/String;J)J

    move-result-wide v2

    iput-wide v2, v0, Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment;->autoSelectedPackId:J

    .line 863
    sget-object v0, Lcom/adobe/creativesdk/aviary/fragments/StoreListFragmentAbstract;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v1, "autoSelectedPackId: %d"

    new-array v2, v9, [Ljava/lang/Object;

    iget-object v3, p0, Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment$Refresher;->this$0:Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment;

    iget-wide v4, v3, Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment;->autoSelectedPackId:J

    invoke-static {v4, v5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v3

    aput-object v3, v2, v8

    invoke-interface {v0, v1, v2}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->warn(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 864
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment$Refresher;->this$0:Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment;

    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment$Refresher;->this$0:Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment;

    iget-wide v2, v1, Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment;->autoSelectedPackId:J

    invoke-virtual {v0, v2, v3, v9}, Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment;->selectPack(JZ)V

    goto/16 :goto_31

    .line 855
    :cond_b9
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment$Refresher;->this$0:Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment;

    iget-object v0, v0, Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment;->adapter:Landroid/support/v4/widget/CursorAdapter;

    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment$Refresher;->mCursor:Landroid/database/Cursor;

    invoke-virtual {v0, v1}, Landroid/support/v4/widget/CursorAdapter;->changeCursor(Landroid/database/Cursor;)V

    goto :goto_67
.end method

.method public onError(Ljava/lang/Throwable;)V
    .registers 5
    .param p1, "throwable"    # Ljava/lang/Throwable;

    .prologue
    .line 870
    sget-object v0, Lcom/adobe/creativesdk/aviary/fragments/StoreListFragmentAbstract;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v1, "Refresher.onError"

    invoke-interface {v0, v1}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->error(Ljava/lang/String;)V

    .line 871
    invoke-virtual {p1}, Ljava/lang/Throwable;->printStackTrace()V

    .line 873
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment$Refresher;->this$0:Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment;

    invoke-virtual {v0}, Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v0

    if-eqz v0, :cond_2c

    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment$Refresher;->this$0:Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment;

    invoke-virtual {v0}, Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment;->isFragmentVisible()Z

    move-result v0

    if-eqz v0, :cond_2c

    .line 874
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment$Refresher;->this$0:Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment;

    invoke-virtual {v0}, Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v0

    invoke-virtual {p1}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x0

    invoke-static {v0, v1, v2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    .line 876
    :cond_2c
    return-void
.end method

.method public bridge synthetic onNext(Ljava/lang/Object;)V
    .registers 2

    .prologue
    .line 759
    check-cast p1, Ljava/util/Map;

    invoke-virtual {p0, p1}, Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment$Refresher;->onNext(Ljava/util/Map;)V

    return-void
.end method

.method public onNext(Ljava/util/Map;)V
    .registers 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/Long;",
            "Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils$PackOptionWithPrice;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 881
    .local p1, "map":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Long;Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils$PackOptionWithPrice;>;"
    sget-object v0, Lcom/adobe/creativesdk/aviary/fragments/StoreListFragmentAbstract;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v1, "Refresher.onNext: map size=%d"

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    invoke-interface {p1}, Ljava/util/Map;->size()I

    move-result v4

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    aput-object v4, v2, v3

    invoke-interface {v0, v1, v2}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->info(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 882
    iput-object p1, p0, Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment$Refresher;->priceMap:Ljava/util/Map;

    .line 883
    return-void
.end method
