.class Lcom/localytics/android/AmpSessionHandler$5$1$1;
.super Ljava/lang/Object;
.source "AmpSessionHandler.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/localytics/android/AmpSessionHandler$5$1;->run()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$2:Lcom/localytics/android/AmpSessionHandler$5$1;


# direct methods
.method constructor <init>(Lcom/localytics/android/AmpSessionHandler$5$1;)V
    .registers 2

    .prologue
    .line 388
    iput-object p1, p0, Lcom/localytics/android/AmpSessionHandler$5$1$1;->this$2:Lcom/localytics/android/AmpSessionHandler$5$1;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 3

    .prologue
    .line 391
    iget-object v0, p0, Lcom/localytics/android/AmpSessionHandler$5$1$1;->this$2:Lcom/localytics/android/AmpSessionHandler$5$1;

    iget-object v0, v0, Lcom/localytics/android/AmpSessionHandler$5$1;->this$1:Lcom/localytics/android/AmpSessionHandler$5;

    iget-object v0, v0, Lcom/localytics/android/AmpSessionHandler$5;->val$adapter:Lcom/localytics/android/AmpRulesAdapter;

    iget-object v1, p0, Lcom/localytics/android/AmpSessionHandler$5$1$1;->this$2:Lcom/localytics/android/AmpSessionHandler$5$1;

    iget-object v1, v1, Lcom/localytics/android/AmpSessionHandler$5$1;->this$1:Lcom/localytics/android/AmpSessionHandler$5;

    iget-object v1, v1, Lcom/localytics/android/AmpSessionHandler$5;->this$0:Lcom/localytics/android/AmpSessionHandler;

    iget-object v1, v1, Lcom/localytics/android/AmpSessionHandler;->mProvider:Lcom/localytics/android/LocalyticsProvider;

    invoke-virtual {v0, v1}, Lcom/localytics/android/AmpRulesAdapter;->updateDataSet(Lcom/localytics/android/LocalyticsProvider;)Z

    .line 392
    iget-object v0, p0, Lcom/localytics/android/AmpSessionHandler$5$1$1;->this$2:Lcom/localytics/android/AmpSessionHandler$5$1;

    iget-object v0, v0, Lcom/localytics/android/AmpSessionHandler$5$1;->this$1:Lcom/localytics/android/AmpSessionHandler$5;

    iget-object v0, v0, Lcom/localytics/android/AmpSessionHandler$5;->val$adapter:Lcom/localytics/android/AmpRulesAdapter;

    invoke-virtual {v0}, Lcom/localytics/android/AmpRulesAdapter;->notifyDataSetChanged()V

    .line 393
    return-void
.end method
