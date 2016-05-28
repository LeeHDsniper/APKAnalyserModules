.class Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity$8;
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
        "Landroid/util/Pair",
        "<",
        "Lcom/adobe/creativesdk/aviary/internal/account/AccountResult;",
        "Lcom/adobe/creativesdk/aviary/internal/cds/util/IabResult;",
        ">;>;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity;


# direct methods
.method constructor <init>(Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity;)V
    .registers 2
    .param p1, "this$0"    # Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity;

    .prologue
    .line 1473
    iput-object p1, p0, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity$8;->this$0:Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public call(Landroid/util/Pair;)V
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/util/Pair",
            "<",
            "Lcom/adobe/creativesdk/aviary/internal/account/AccountResult;",
            "Lcom/adobe/creativesdk/aviary/internal/cds/util/IabResult;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 1477
    .local p1, "result":Landroid/util/Pair;, "Landroid/util/Pair<Lcom/adobe/creativesdk/aviary/internal/account/AccountResult;Lcom/adobe/creativesdk/aviary/internal/cds/util/IabResult;>;"
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity$8;->this$0:Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity;

    invoke-virtual {v0, p1}, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity;->onSetupDone(Landroid/util/Pair;)V

    .line 1478
    return-void
.end method

.method public bridge synthetic call(Ljava/lang/Object;)V
    .registers 2

    .prologue
    .line 1473
    check-cast p1, Landroid/util/Pair;

    invoke-virtual {p0, p1}, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity$8;->call(Landroid/util/Pair;)V

    return-void
.end method
