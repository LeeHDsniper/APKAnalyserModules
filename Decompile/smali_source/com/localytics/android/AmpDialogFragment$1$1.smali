.class Lcom/localytics/android/AmpDialogFragment$1$1;
.super Ljava/lang/Object;
.source "AmpDialogFragment.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/localytics/android/AmpDialogFragment$1;->call([Ljava/lang/Object;)Ljava/lang/Object;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/localytics/android/AmpDialogFragment$1;

.field final synthetic val$mWebView:Lcom/localytics/android/AmpDialogFragment$AmpDialog$AmpWebView;

.field final synthetic val$url:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/localytics/android/AmpDialogFragment$1;Lcom/localytics/android/AmpDialogFragment$AmpDialog$AmpWebView;Ljava/lang/String;)V
    .registers 4

    .prologue
    .line 319
    iput-object p1, p0, Lcom/localytics/android/AmpDialogFragment$1$1;->this$1:Lcom/localytics/android/AmpDialogFragment$1;

    iput-object p2, p0, Lcom/localytics/android/AmpDialogFragment$1$1;->val$mWebView:Lcom/localytics/android/AmpDialogFragment$AmpDialog$AmpWebView;

    iput-object p3, p0, Lcom/localytics/android/AmpDialogFragment$1$1;->val$url:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 3

    .prologue
    .line 322
    iget-object v0, p0, Lcom/localytics/android/AmpDialogFragment$1$1;->val$mWebView:Lcom/localytics/android/AmpDialogFragment$AmpDialog$AmpWebView;

    iget-object v1, p0, Lcom/localytics/android/AmpDialogFragment$1$1;->val$url:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lcom/localytics/android/AmpDialogFragment$AmpDialog$AmpWebView;->loadUrl(Ljava/lang/String;)V

    .line 323
    return-void
.end method
