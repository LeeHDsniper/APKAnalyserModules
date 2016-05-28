.class Lcom/adobe/creativesdk/aviary/widget/IAPBuyButton$InnerVisibility;
.super Ljava/lang/Object;
.source "IAPBuyButton.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/adobe/creativesdk/aviary/widget/IAPBuyButton;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "InnerVisibility"
.end annotation


# instance fields
.field private newEnableStatus:Z

.field private newProgressVisibility:I

.field private newTextVisibility:I

.field private final option:Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils$PackOptionWithPrice;

.field final synthetic this$0:Lcom/adobe/creativesdk/aviary/widget/IAPBuyButton;


# direct methods
.method public constructor <init>(Lcom/adobe/creativesdk/aviary/widget/IAPBuyButton;Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils$PackOptionWithPrice;ZII)V
    .registers 6
    .param p2, "option"    # Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils$PackOptionWithPrice;
    .param p3, "newEnableStatus"    # Z
    .param p4, "newProgressVisibility"    # I
    .param p5, "newTextVisibility"    # I

    .prologue
    .line 216
    iput-object p1, p0, Lcom/adobe/creativesdk/aviary/widget/IAPBuyButton$InnerVisibility;->this$0:Lcom/adobe/creativesdk/aviary/widget/IAPBuyButton;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 217
    iput-object p2, p0, Lcom/adobe/creativesdk/aviary/widget/IAPBuyButton$InnerVisibility;->option:Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils$PackOptionWithPrice;

    .line 218
    iput-boolean p3, p0, Lcom/adobe/creativesdk/aviary/widget/IAPBuyButton$InnerVisibility;->newEnableStatus:Z

    .line 219
    iput p4, p0, Lcom/adobe/creativesdk/aviary/widget/IAPBuyButton$InnerVisibility;->newProgressVisibility:I

    .line 220
    iput p5, p0, Lcom/adobe/creativesdk/aviary/widget/IAPBuyButton$InnerVisibility;->newTextVisibility:I

    .line 221
    return-void
.end method

.method static synthetic access$000(Lcom/adobe/creativesdk/aviary/widget/IAPBuyButton$InnerVisibility;)Z
    .registers 2
    .param p0, "x0"    # Lcom/adobe/creativesdk/aviary/widget/IAPBuyButton$InnerVisibility;

    .prologue
    .line 208
    iget-boolean v0, p0, Lcom/adobe/creativesdk/aviary/widget/IAPBuyButton$InnerVisibility;->newEnableStatus:Z

    return v0
.end method

.method static synthetic access$100(Lcom/adobe/creativesdk/aviary/widget/IAPBuyButton$InnerVisibility;)I
    .registers 2
    .param p0, "x0"    # Lcom/adobe/creativesdk/aviary/widget/IAPBuyButton$InnerVisibility;

    .prologue
    .line 208
    iget v0, p0, Lcom/adobe/creativesdk/aviary/widget/IAPBuyButton$InnerVisibility;->newProgressVisibility:I

    return v0
.end method

.method static synthetic access$200(Lcom/adobe/creativesdk/aviary/widget/IAPBuyButton$InnerVisibility;)I
    .registers 2
    .param p0, "x0"    # Lcom/adobe/creativesdk/aviary/widget/IAPBuyButton$InnerVisibility;

    .prologue
    .line 208
    iget v0, p0, Lcom/adobe/creativesdk/aviary/widget/IAPBuyButton$InnerVisibility;->newTextVisibility:I

    return v0
.end method


# virtual methods
.method public invoke()Lcom/adobe/creativesdk/aviary/widget/IAPBuyButton$InnerVisibility;
    .registers 7

    .prologue
    const/4 v2, 0x0

    .line 228
    sget-object v0, Lcom/adobe/creativesdk/aviary/widget/IAPBuyButton$2;->$SwitchMap$com$adobe$creativesdk$aviary$internal$cds$CdsUtils$PackOption:[I

    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/widget/IAPBuyButton$InnerVisibility;->option:Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils$PackOptionWithPrice;

    iget-object v1, v1, Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils$PackOptionWithPrice;->option:Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils$PackOption;

    invoke-virtual {v1}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils$PackOption;->ordinal()I

    move-result v1

    aget v0, v0, v1

    packed-switch v0, :pswitch_data_c2

    .line 290
    :cond_10
    :goto_10
    return-object p0

    .line 230
    :pswitch_11
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/IAPBuyButton$InnerVisibility;->this$0:Lcom/adobe/creativesdk/aviary/widget/IAPBuyButton;

    iget-object v0, v0, Lcom/adobe/creativesdk/aviary/widget/IAPBuyButton;->mTextView:Landroid/widget/TextView;

    sget v1, Lcom/aviary/android/feather/sdk/R$string;->feather_iap_restore:I

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(I)V

    goto :goto_10

    .line 234
    :pswitch_1b
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/IAPBuyButton$InnerVisibility;->this$0:Lcom/adobe/creativesdk/aviary/widget/IAPBuyButton;

    iget-object v0, v0, Lcom/adobe/creativesdk/aviary/widget/IAPBuyButton;->mTextView:Landroid/widget/TextView;

    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setVisibility(I)V

    .line 235
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/IAPBuyButton$InnerVisibility;->option:Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils$PackOptionWithPrice;

    iget-object v0, v0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils$PackOptionWithPrice;->price:Ljava/lang/String;

    if-eqz v0, :cond_34

    .line 236
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/IAPBuyButton$InnerVisibility;->this$0:Lcom/adobe/creativesdk/aviary/widget/IAPBuyButton;

    iget-object v0, v0, Lcom/adobe/creativesdk/aviary/widget/IAPBuyButton;->mTextView:Landroid/widget/TextView;

    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/widget/IAPBuyButton$InnerVisibility;->option:Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils$PackOptionWithPrice;

    iget-object v1, v1, Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils$PackOptionWithPrice;->price:Ljava/lang/String;

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto :goto_10

    .line 238
    :cond_34
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/IAPBuyButton$InnerVisibility;->this$0:Lcom/adobe/creativesdk/aviary/widget/IAPBuyButton;

    iget-object v0, v0, Lcom/adobe/creativesdk/aviary/widget/IAPBuyButton;->mTextView:Landroid/widget/TextView;

    sget v1, Lcom/aviary/android/feather/sdk/R$string;->feather_iap_unavailable:I

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(I)V

    goto :goto_10

    .line 243
    :pswitch_3e
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/IAPBuyButton$InnerVisibility;->this$0:Lcom/adobe/creativesdk/aviary/widget/IAPBuyButton;

    iget-object v0, v0, Lcom/adobe/creativesdk/aviary/widget/IAPBuyButton;->mTextView:Landroid/widget/TextView;

    sget v1, Lcom/aviary/android/feather/sdk/R$string;->feather_iap_owned:I

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(I)V

    .line 244
    iput-boolean v2, p0, Lcom/adobe/creativesdk/aviary/widget/IAPBuyButton$InnerVisibility;->newEnableStatus:Z

    goto :goto_10

    .line 248
    :pswitch_4a
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/IAPBuyButton$InnerVisibility;->this$0:Lcom/adobe/creativesdk/aviary/widget/IAPBuyButton;

    iget-object v0, v0, Lcom/adobe/creativesdk/aviary/widget/IAPBuyButton;->mTextView:Landroid/widget/TextView;

    sget v1, Lcom/aviary/android/feather/sdk/R$string;->feather_iap_uninstall:I

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(I)V

    goto :goto_10

    .line 252
    :pswitch_54
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/IAPBuyButton$InnerVisibility;->this$0:Lcom/adobe/creativesdk/aviary/widget/IAPBuyButton;

    iget-object v0, v0, Lcom/adobe/creativesdk/aviary/widget/IAPBuyButton;->mTextView:Landroid/widget/TextView;

    sget v1, Lcom/aviary/android/feather/sdk/R$string;->feather_iap_retry:I

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(I)V

    goto :goto_10

    .line 257
    :pswitch_5e
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/IAPBuyButton$InnerVisibility;->this$0:Lcom/adobe/creativesdk/aviary/widget/IAPBuyButton;

    iget-object v0, v0, Lcom/adobe/creativesdk/aviary/widget/IAPBuyButton;->mTextView:Landroid/widget/TextView;

    sget v1, Lcom/aviary/android/feather/sdk/R$string;->feather_iap_download:I

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(I)V

    goto :goto_10

    .line 261
    :pswitch_68
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/IAPBuyButton$InnerVisibility;->this$0:Lcom/adobe/creativesdk/aviary/widget/IAPBuyButton;

    iget-object v0, v0, Lcom/adobe/creativesdk/aviary/widget/IAPBuyButton;->mTextView:Landroid/widget/TextView;

    sget v1, Lcom/aviary/android/feather/sdk/R$string;->feather_iap_installing:I

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(I)V

    .line 262
    iput-boolean v2, p0, Lcom/adobe/creativesdk/aviary/widget/IAPBuyButton$InnerVisibility;->newEnableStatus:Z

    goto :goto_10

    .line 266
    :pswitch_74
    iput v2, p0, Lcom/adobe/creativesdk/aviary/widget/IAPBuyButton$InnerVisibility;->newProgressVisibility:I

    .line 267
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/IAPBuyButton$InnerVisibility;->this$0:Lcom/adobe/creativesdk/aviary/widget/IAPBuyButton;

    iget-object v0, v0, Lcom/adobe/creativesdk/aviary/widget/IAPBuyButton;->mTextView:Landroid/widget/TextView;

    const-string v1, ""

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 268
    iput-boolean v2, p0, Lcom/adobe/creativesdk/aviary/widget/IAPBuyButton$InnerVisibility;->newEnableStatus:Z

    .line 270
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/IAPBuyButton$InnerVisibility;->this$0:Lcom/adobe/creativesdk/aviary/widget/IAPBuyButton;

    invoke-virtual {v0}, Lcom/adobe/creativesdk/aviary/widget/IAPBuyButton;->getHandler()Landroid/os/Handler;

    move-result-object v0

    if-eqz v0, :cond_10

    .line 271
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/IAPBuyButton$InnerVisibility;->this$0:Lcom/adobe/creativesdk/aviary/widget/IAPBuyButton;

    invoke-virtual {v0}, Lcom/adobe/creativesdk/aviary/widget/IAPBuyButton;->getHandler()Landroid/os/Handler;

    move-result-object v0

    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/widget/IAPBuyButton$InnerVisibility;->this$0:Lcom/adobe/creativesdk/aviary/widget/IAPBuyButton;

    iget-object v1, v1, Lcom/adobe/creativesdk/aviary/widget/IAPBuyButton;->checkDownloadStatus:Ljava/lang/Runnable;

    invoke-static {}, Ljava/lang/Math;->random()D

    move-result-wide v2

    const-wide/high16 v4, 0x4059000000000000L

    mul-double/2addr v2, v4

    const-wide v4, 0x408c200000000000L

    add-double/2addr v2, v4

    double-to-long v2, v2

    invoke-virtual {v0, v1, v2, v3}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    goto/16 :goto_10

    .line 276
    :pswitch_a6
    iput v2, p0, Lcom/adobe/creativesdk/aviary/widget/IAPBuyButton$InnerVisibility;->newProgressVisibility:I

    .line 277
    iput v2, p0, Lcom/adobe/creativesdk/aviary/widget/IAPBuyButton$InnerVisibility;->newTextVisibility:I

    .line 278
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/IAPBuyButton$InnerVisibility;->this$0:Lcom/adobe/creativesdk/aviary/widget/IAPBuyButton;

    iget-object v0, v0, Lcom/adobe/creativesdk/aviary/widget/IAPBuyButton;->mTextView:Landroid/widget/TextView;

    const-string v1, ""

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 279
    iput-boolean v2, p0, Lcom/adobe/creativesdk/aviary/widget/IAPBuyButton$InnerVisibility;->newEnableStatus:Z

    goto/16 :goto_10

    .line 283
    :pswitch_b7
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/IAPBuyButton$InnerVisibility;->this$0:Lcom/adobe/creativesdk/aviary/widget/IAPBuyButton;

    iget-object v0, v0, Lcom/adobe/creativesdk/aviary/widget/IAPBuyButton;->mTextView:Landroid/widget/TextView;

    sget v1, Lcom/aviary/android/feather/sdk/R$string;->feather_iap_retry:I

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(I)V

    goto/16 :goto_10

    .line 228
    :pswitch_data_c2
    .packed-switch 0x1
        :pswitch_11
        :pswitch_1b
        :pswitch_3e
        :pswitch_4a
        :pswitch_54
        :pswitch_5e
        :pswitch_5e
        :pswitch_68
        :pswitch_74
        :pswitch_a6
        :pswitch_b7
    .end packed-switch
.end method

.method public isNewEnableStatus()Z
    .registers 2

    .prologue
    .line 224
    iget-boolean v0, p0, Lcom/adobe/creativesdk/aviary/widget/IAPBuyButton$InnerVisibility;->newEnableStatus:Z

    return v0
.end method
