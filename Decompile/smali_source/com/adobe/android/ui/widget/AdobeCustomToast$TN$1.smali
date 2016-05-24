.class Lcom/adobe/android/ui/widget/AdobeCustomToast$TN$1;
.super Ljava/lang/Object;
.source "AdobeCustomToast.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/adobe/android/ui/widget/AdobeCustomToast$TN;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/adobe/android/ui/widget/AdobeCustomToast$TN;


# direct methods
.method constructor <init>(Lcom/adobe/android/ui/widget/AdobeCustomToast$TN;)V
    .registers 2
    .param p1, "this$1"    # Lcom/adobe/android/ui/widget/AdobeCustomToast$TN;

    .prologue
    .line 103
    iput-object p1, p0, Lcom/adobe/android/ui/widget/AdobeCustomToast$TN$1;->this$1:Lcom/adobe/android/ui/widget/AdobeCustomToast$TN;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 2

    .prologue
    .line 106
    iget-object v0, p0, Lcom/adobe/android/ui/widget/AdobeCustomToast$TN$1;->this$1:Lcom/adobe/android/ui/widget/AdobeCustomToast$TN;

    invoke-virtual {v0}, Lcom/adobe/android/ui/widget/AdobeCustomToast$TN;->handleShow()V

    .line 107
    return-void
.end method
