.class Lcom/localytics/android/AmpSessionHandler$4;
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

.field final synthetic val$button:Lcom/localytics/android/TestModeButton;


# direct methods
.method constructor <init>(Lcom/localytics/android/AmpSessionHandler;Lcom/localytics/android/TestModeButton;)V
    .registers 3

    .prologue
    .line 365
    iput-object p1, p0, Lcom/localytics/android/AmpSessionHandler$4;->this$0:Lcom/localytics/android/AmpSessionHandler;

    iput-object p2, p0, Lcom/localytics/android/AmpSessionHandler$4;->val$button:Lcom/localytics/android/TestModeButton;

    invoke-direct {p0}, Lcom/localytics/android/AmpCallable;-><init>()V

    return-void
.end method


# virtual methods
.method call([Ljava/lang/Object;)Ljava/lang/Object;
    .registers 5
    .param p1, "params"    # [Ljava/lang/Object;

    .prologue
    .line 369
    iget-object v0, p0, Lcom/localytics/android/AmpSessionHandler$4;->val$button:Lcom/localytics/android/TestModeButton;

    iget-object v1, p0, Lcom/localytics/android/AmpSessionHandler$4;->this$0:Lcom/localytics/android/AmpSessionHandler;

    # getter for: Lcom/localytics/android/AmpSessionHandler;->mFragmentManager:Landroid/support/v4/app/FragmentManager;
    invoke-static {v1}, Lcom/localytics/android/AmpSessionHandler;->access$000(Lcom/localytics/android/AmpSessionHandler;)Landroid/support/v4/app/FragmentManager;

    move-result-object v1

    const-string v2, "amp_test_mode_button"

    invoke-virtual {v0, v1, v2}, Lcom/localytics/android/TestModeButton;->show(Landroid/support/v4/app/FragmentManager;Ljava/lang/String;)V

    .line 370
    iget-object v0, p0, Lcom/localytics/android/AmpSessionHandler$4;->this$0:Lcom/localytics/android/AmpSessionHandler;

    # getter for: Lcom/localytics/android/AmpSessionHandler;->mFragmentManager:Landroid/support/v4/app/FragmentManager;
    invoke-static {v0}, Lcom/localytics/android/AmpSessionHandler;->access$000(Lcom/localytics/android/AmpSessionHandler;)Landroid/support/v4/app/FragmentManager;

    move-result-object v0

    invoke-virtual {v0}, Landroid/support/v4/app/FragmentManager;->executePendingTransactions()Z

    .line 371
    const/4 v0, 0x0

    return-object v0
.end method
