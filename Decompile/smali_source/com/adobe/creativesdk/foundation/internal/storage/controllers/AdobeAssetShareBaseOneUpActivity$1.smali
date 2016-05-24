.class Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetShareBaseOneUpActivity$1;
.super Ljava/lang/Object;
.source "AdobeAssetShareBaseOneUpActivity.java"

# interfaces
.implements Landroid/view/View$OnTouchListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetShareBaseOneUpActivity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field private pointX:F

.field private pointY:F

.field final synthetic this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetShareBaseOneUpActivity;

.field private final tolerance:I


# direct methods
.method constructor <init>(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetShareBaseOneUpActivity;)V
    .registers 3
    .param p1, "this$0"    # Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetShareBaseOneUpActivity;

    .prologue
    .line 67
    iput-object p1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetShareBaseOneUpActivity$1;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetShareBaseOneUpActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 70
    const/16 v0, 0x32

    iput v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetShareBaseOneUpActivity$1;->tolerance:I

    return-void
.end method


# virtual methods
.method public onTouch(Landroid/view/View;Landroid/view/MotionEvent;)Z
    .registers 10
    .param p1, "v"    # Landroid/view/View;
    .param p2, "event"    # Landroid/view/MotionEvent;

    .prologue
    const/4 v2, 0x1

    const/4 v3, 0x0

    const/high16 v6, 0x42480000

    .line 74
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getAction()I

    move-result v4

    packed-switch v4, :pswitch_data_56

    .line 89
    :cond_b
    :goto_b
    :pswitch_b
    return v3

    .line 78
    :pswitch_c
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getX()F

    move-result v2

    iput v2, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetShareBaseOneUpActivity$1;->pointX:F

    .line 79
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getY()F

    move-result v2

    iput v2, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetShareBaseOneUpActivity$1;->pointY:F

    goto :goto_b

    .line 82
    :pswitch_19
    iget v4, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetShareBaseOneUpActivity$1;->pointX:F

    add-float/2addr v4, v6

    invoke-virtual {p2}, Landroid/view/MotionEvent;->getX()F

    move-result v5

    cmpl-float v4, v4, v5

    if-lez v4, :cond_51

    iget v4, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetShareBaseOneUpActivity$1;->pointX:F

    sub-float/2addr v4, v6

    invoke-virtual {p2}, Landroid/view/MotionEvent;->getX()F

    move-result v5

    cmpg-float v4, v4, v5

    if-gez v4, :cond_51

    move v0, v2

    .line 83
    .local v0, "sameX":Z
    :goto_30
    iget v4, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetShareBaseOneUpActivity$1;->pointY:F

    add-float/2addr v4, v6

    invoke-virtual {p2}, Landroid/view/MotionEvent;->getY()F

    move-result v5

    cmpl-float v4, v4, v5

    if-lez v4, :cond_53

    iget v4, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetShareBaseOneUpActivity$1;->pointY:F

    sub-float/2addr v4, v6

    invoke-virtual {p2}, Landroid/view/MotionEvent;->getY()F

    move-result v5

    cmpg-float v4, v4, v5

    if-gez v4, :cond_53

    move v1, v2

    .line 84
    .local v1, "sameY":Z
    :goto_47
    if-eqz v0, :cond_b

    if-eqz v1, :cond_b

    .line 86
    iget-object v2, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetShareBaseOneUpActivity$1;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetShareBaseOneUpActivity;

    invoke-virtual {v2}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetShareBaseOneUpActivity;->hideOrShowBaseActivityActionsBar()V

    goto :goto_b

    .end local v0    # "sameX":Z
    .end local v1    # "sameY":Z
    :cond_51
    move v0, v3

    .line 82
    goto :goto_30

    .restart local v0    # "sameX":Z
    :cond_53
    move v1, v3

    .line 83
    goto :goto_47

    .line 74
    nop

    :pswitch_data_56
    .packed-switch 0x0
        :pswitch_c
        :pswitch_19
        :pswitch_b
    .end packed-switch
.end method
