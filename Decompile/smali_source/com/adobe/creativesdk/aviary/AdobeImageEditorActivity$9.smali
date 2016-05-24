.class Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity$9;
.super Ljava/lang/Object;
.source "AdobeImageEditorActivity.java"

# interfaces
.implements Lrx/functions/Action1;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity;->onServiceConnected(Lcom/adobe/creativesdk/aviary/AdobeImageBillingService;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lrx/functions/Action1",
        "<",
        "Ljava/lang/Throwable;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity;


# direct methods
.method constructor <init>(Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity;)V
    .registers 2
    .param p1, "this$0"    # Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity;

    .prologue
    .line 1480
    iput-object p1, p0, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity$9;->this$0:Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public bridge synthetic call(Ljava/lang/Object;)V
    .registers 2

    .prologue
    .line 1480
    check-cast p1, Ljava/lang/Throwable;

    invoke-virtual {p0, p1}, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity$9;->call(Ljava/lang/Throwable;)V

    return-void
.end method

.method public call(Ljava/lang/Throwable;)V
    .registers 4
    .param p1, "throwable"    # Ljava/lang/Throwable;

    .prologue
    .line 1483
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity$9;->this$0:Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity;->onSetupDone(Landroid/util/Pair;)V

    .line 1484
    return-void
.end method
