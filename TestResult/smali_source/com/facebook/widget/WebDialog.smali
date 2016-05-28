.class public Lcom/facebook/widget/WebDialog;
.super Landroid/app/Dialog;
.source "WebDialog.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/facebook/widget/WebDialog$Builder;,
        Lcom/facebook/widget/WebDialog$BuilderBase;,
        Lcom/facebook/widget/WebDialog$DialogWebViewClient;,
        Lcom/facebook/widget/WebDialog$OnCompleteListener;
    }
.end annotation


# instance fields
.field private contentFrameLayout:Landroid/widget/FrameLayout;

.field private crossImageView:Landroid/widget/ImageView;

.field private isDetached:Z

.field private listenerCalled:Z

.field private onCompleteListener:Lcom/facebook/widget/WebDialog$OnCompleteListener;

.field private spinner:Landroid/app/ProgressDialog;

.field private url:Ljava/lang/String;

.field private webView:Landroid/webkit/WebView;


# direct methods
.method public constructor <init>(Landroid/content/Context;Ljava/lang/String;Landroid/os/Bundle;ILcom/facebook/widget/WebDialog$OnCompleteListener;)V
    .registers 10
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "action"    # Ljava/lang/String;
    .param p3, "parameters"    # Landroid/os/Bundle;
    .param p4, "theme"    # I
    .param p5, "listener"    # Lcom/facebook/widget/WebDialog$OnCompleteListener;

    .prologue
    const/4 v1, 0x0

    .line 144
    invoke-direct {p0, p1, p4}, Landroid/app/Dialog;-><init>(Landroid/content/Context;I)V

    .line 92
    iput-boolean v1, p0, Lcom/facebook/widget/WebDialog;->listenerCalled:Z

    .line 93
    iput-boolean v1, p0, Lcom/facebook/widget/WebDialog;->isDetached:Z

    .line 146
    if-nez p3, :cond_f

    .line 147
    new-instance p3, Landroid/os/Bundle;

    .end local p3    # "parameters":Landroid/os/Bundle;
    invoke-direct {p3}, Landroid/os/Bundle;-><init>()V

    .line 151
    .restart local p3    # "parameters":Landroid/os/Bundle;
    :cond_f
    const-string v1, "redirect_uri"

    const-string v2, "fbconnect://success"

    invoke-virtual {p3, v1, v2}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 153
    const-string v1, "display"

    const-string v2, "touch"

    invoke-virtual {p3, v1, v2}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 156
    invoke-static {}, Lcom/facebook/internal/ServerProtocol;->getDialogAuthority()Ljava/lang/String;

    move-result-object v1

    .line 157
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-static {}, Lcom/facebook/internal/ServerProtocol;->getAPIVersion()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v3, "/"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "dialog/"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 155
    invoke-static {v1, v2, p3}, Lcom/facebook/internal/Utility;->buildUri(Ljava/lang/String;Ljava/lang/String;Landroid/os/Bundle;)Landroid/net/Uri;

    move-result-object v0

    .line 159
    .local v0, "uri":Landroid/net/Uri;
    invoke-virtual {v0}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/facebook/widget/WebDialog;->url:Ljava/lang/String;

    .line 160
    iput-object p5, p0, Lcom/facebook/widget/WebDialog;->onCompleteListener:Lcom/facebook/widget/WebDialog$OnCompleteListener;

    .line 161
    return-void
.end method

.method static synthetic access$0(Lcom/facebook/widget/WebDialog;Landroid/os/Bundle;)V
    .registers 2

    .prologue
    .line 306
    invoke-direct {p0, p1}, Lcom/facebook/widget/WebDialog;->sendSuccessToListener(Landroid/os/Bundle;)V

    return-void
.end method

.method static synthetic access$1(Lcom/facebook/widget/WebDialog;)V
    .registers 1

    .prologue
    .line 326
    invoke-direct {p0}, Lcom/facebook/widget/WebDialog;->sendCancelToListener()V

    return-void
.end method

.method static synthetic access$2(Lcom/facebook/widget/WebDialog;Ljava/lang/Throwable;)V
    .registers 2

    .prologue
    .line 313
    invoke-direct {p0, p1}, Lcom/facebook/widget/WebDialog;->sendErrorToListener(Ljava/lang/Throwable;)V

    return-void
.end method

.method static synthetic access$3(Lcom/facebook/widget/WebDialog;)Z
    .registers 2

    .prologue
    .line 93
    iget-boolean v0, p0, Lcom/facebook/widget/WebDialog;->isDetached:Z

    return v0
.end method

.method static synthetic access$4(Lcom/facebook/widget/WebDialog;)Landroid/app/ProgressDialog;
    .registers 2

    .prologue
    .line 89
    iget-object v0, p0, Lcom/facebook/widget/WebDialog;->spinner:Landroid/app/ProgressDialog;

    return-object v0
.end method

.method static synthetic access$5(Lcom/facebook/widget/WebDialog;)Landroid/widget/FrameLayout;
    .registers 2

    .prologue
    .line 91
    iget-object v0, p0, Lcom/facebook/widget/WebDialog;->contentFrameLayout:Landroid/widget/FrameLayout;

    return-object v0
.end method

.method static synthetic access$6(Lcom/facebook/widget/WebDialog;)Landroid/webkit/WebView;
    .registers 2

    .prologue
    .line 88
    iget-object v0, p0, Lcom/facebook/widget/WebDialog;->webView:Landroid/webkit/WebView;

    return-object v0
.end method

.method static synthetic access$7(Lcom/facebook/widget/WebDialog;)Landroid/widget/ImageView;
    .registers 2

    .prologue
    .line 90
    iget-object v0, p0, Lcom/facebook/widget/WebDialog;->crossImageView:Landroid/widget/ImageView;

    return-object v0
.end method

.method private calculateSize()V
    .registers 11

    .prologue
    const/16 v9, 0x320

    .line 261
    invoke-virtual {p0}, Lcom/facebook/widget/WebDialog;->getContext()Landroid/content/Context;

    move-result-object v7

    const-string v8, "window"

    invoke-virtual {v7, v8}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Landroid/view/WindowManager;

    .line 262
    .local v6, "wm":Landroid/view/WindowManager;
    invoke-interface {v6}, Landroid/view/WindowManager;->getDefaultDisplay()Landroid/view/Display;

    move-result-object v2

    .line 263
    .local v2, "display":Landroid/view/Display;
    new-instance v4, Landroid/util/DisplayMetrics;

    invoke-direct {v4}, Landroid/util/DisplayMetrics;-><init>()V

    .line 264
    .local v4, "metrics":Landroid/util/DisplayMetrics;
    invoke-virtual {v2, v4}, Landroid/view/Display;->getMetrics(Landroid/util/DisplayMetrics;)V

    .line 267
    iget v7, v4, Landroid/util/DisplayMetrics;->widthPixels:I

    iget v8, v4, Landroid/util/DisplayMetrics;->heightPixels:I

    if-ge v7, v8, :cond_4e

    iget v5, v4, Landroid/util/DisplayMetrics;->widthPixels:I

    .line 268
    .local v5, "width":I
    :goto_22
    iget v7, v4, Landroid/util/DisplayMetrics;->widthPixels:I

    iget v8, v4, Landroid/util/DisplayMetrics;->heightPixels:I

    if-ge v7, v8, :cond_51

    iget v3, v4, Landroid/util/DisplayMetrics;->heightPixels:I

    .line 271
    .local v3, "height":I
    :goto_2a
    iget v7, v4, Landroid/util/DisplayMetrics;->density:F

    const/16 v8, 0x1e0

    invoke-direct {p0, v5, v7, v8, v9}, Lcom/facebook/widget/WebDialog;->getScaledSize(IFII)I

    move-result v7

    .line 272
    iget v8, v4, Landroid/util/DisplayMetrics;->widthPixels:I

    .line 270
    invoke-static {v7, v8}, Ljava/lang/Math;->min(II)I

    move-result v1

    .line 274
    .local v1, "dialogWidth":I
    iget v7, v4, Landroid/util/DisplayMetrics;->density:F

    const/16 v8, 0x500

    invoke-direct {p0, v3, v7, v9, v8}, Lcom/facebook/widget/WebDialog;->getScaledSize(IFII)I

    move-result v7

    .line 275
    iget v8, v4, Landroid/util/DisplayMetrics;->heightPixels:I

    .line 273
    invoke-static {v7, v8}, Ljava/lang/Math;->min(II)I

    move-result v0

    .line 277
    .local v0, "dialogHeight":I
    invoke-virtual {p0}, Lcom/facebook/widget/WebDialog;->getWindow()Landroid/view/Window;

    move-result-object v7

    invoke-virtual {v7, v1, v0}, Landroid/view/Window;->setLayout(II)V

    .line 278
    return-void

    .line 267
    .end local v0    # "dialogHeight":I
    .end local v1    # "dialogWidth":I
    .end local v3    # "height":I
    .end local v5    # "width":I
    :cond_4e
    iget v5, v4, Landroid/util/DisplayMetrics;->heightPixels:I

    goto :goto_22

    .line 268
    .restart local v5    # "width":I
    :cond_51
    iget v3, v4, Landroid/util/DisplayMetrics;->widthPixels:I

    goto :goto_2a
.end method

.method private createCrossImage()V
    .registers 4

    .prologue
    .line 331
    new-instance v1, Landroid/widget/ImageView;

    invoke-virtual {p0}, Lcom/facebook/widget/WebDialog;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-direct {v1, v2}, Landroid/widget/ImageView;-><init>(Landroid/content/Context;)V

    iput-object v1, p0, Lcom/facebook/widget/WebDialog;->crossImageView:Landroid/widget/ImageView;

    .line 333
    iget-object v1, p0, Lcom/facebook/widget/WebDialog;->crossImageView:Landroid/widget/ImageView;

    new-instance v2, Lcom/facebook/widget/WebDialog$3;

    invoke-direct {v2, p0}, Lcom/facebook/widget/WebDialog$3;-><init>(Lcom/facebook/widget/WebDialog;)V

    invoke-virtual {v1, v2}, Landroid/widget/ImageView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 340
    invoke-virtual {p0}, Lcom/facebook/widget/WebDialog;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    sget v2, Lcom/behance/sdk/R$drawable;->com_facebook_close:I

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    .line 341
    .local v0, "crossDrawable":Landroid/graphics/drawable/Drawable;
    iget-object v1, p0, Lcom/facebook/widget/WebDialog;->crossImageView:Landroid/widget/ImageView;

    invoke-virtual {v1, v0}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 345
    iget-object v1, p0, Lcom/facebook/widget/WebDialog;->crossImageView:Landroid/widget/ImageView;

    const/4 v2, 0x4

    invoke-virtual {v1, v2}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 346
    return-void
.end method

.method private getScaledSize(IFII)I
    .registers 15
    .param p1, "screenSize"    # I
    .param p2, "density"    # F
    .param p3, "noPaddingSize"    # I
    .param p4, "maxPaddingSize"    # I

    .prologue
    const-wide/high16 v8, 0x3fe0000000000000L

    .line 289
    int-to-float v3, p1

    div-float/2addr v3, p2

    float-to-int v2, v3

    .line 291
    .local v2, "scaledSize":I
    if-gt v2, p3, :cond_d

    .line 292
    const-wide/high16 v0, 0x3ff0000000000000L

    .line 303
    .local v0, "scaleFactor":D
    :goto_9
    int-to-double v4, p1

    mul-double/2addr v4, v0

    double-to-int v3, v4

    return v3

    .line 293
    .end local v0    # "scaleFactor":D
    :cond_d
    if-lt v2, p4, :cond_12

    .line 294
    const-wide/high16 v0, 0x3fe0000000000000L

    .line 295
    .restart local v0    # "scaleFactor":D
    goto :goto_9

    .line 299
    .end local v0    # "scaleFactor":D
    :cond_12
    sub-int v3, p4, v2

    int-to-double v4, v3

    .line 300
    sub-int v3, p4, p3

    int-to-double v6, v3

    .line 299
    div-double/2addr v4, v6

    mul-double/2addr v4, v8

    .line 298
    add-double v0, v8, v4

    .restart local v0    # "scaleFactor":D
    goto :goto_9
.end method

.method private sendCancelToListener()V
    .registers 2

    .prologue
    .line 327
    new-instance v0, Lcom/facebook/FacebookOperationCanceledException;

    invoke-direct {v0}, Lcom/facebook/FacebookOperationCanceledException;-><init>()V

    invoke-direct {p0, v0}, Lcom/facebook/widget/WebDialog;->sendErrorToListener(Ljava/lang/Throwable;)V

    .line 328
    return-void
.end method

.method private sendErrorToListener(Ljava/lang/Throwable;)V
    .registers 5
    .param p1, "error"    # Ljava/lang/Throwable;

    .prologue
    .line 314
    iget-object v1, p0, Lcom/facebook/widget/WebDialog;->onCompleteListener:Lcom/facebook/widget/WebDialog$OnCompleteListener;

    if-eqz v1, :cond_19

    iget-boolean v1, p0, Lcom/facebook/widget/WebDialog;->listenerCalled:Z

    if-nez v1, :cond_19

    .line 315
    const/4 v1, 0x1

    iput-boolean v1, p0, Lcom/facebook/widget/WebDialog;->listenerCalled:Z

    .line 316
    const/4 v0, 0x0

    .line 317
    .local v0, "facebookException":Lcom/facebook/FacebookException;
    instance-of v1, p1, Lcom/facebook/FacebookException;

    if-eqz v1, :cond_1a

    move-object v0, p1

    .line 318
    check-cast v0, Lcom/facebook/FacebookException;

    .line 322
    :goto_13
    iget-object v1, p0, Lcom/facebook/widget/WebDialog;->onCompleteListener:Lcom/facebook/widget/WebDialog$OnCompleteListener;

    const/4 v2, 0x0

    invoke-interface {v1, v2, v0}, Lcom/facebook/widget/WebDialog$OnCompleteListener;->onComplete(Landroid/os/Bundle;Lcom/facebook/FacebookException;)V

    .line 324
    .end local v0    # "facebookException":Lcom/facebook/FacebookException;
    :cond_19
    return-void

    .line 320
    .restart local v0    # "facebookException":Lcom/facebook/FacebookException;
    :cond_1a
    new-instance v0, Lcom/facebook/FacebookException;

    .end local v0    # "facebookException":Lcom/facebook/FacebookException;
    invoke-direct {v0, p1}, Lcom/facebook/FacebookException;-><init>(Ljava/lang/Throwable;)V

    .restart local v0    # "facebookException":Lcom/facebook/FacebookException;
    goto :goto_13
.end method

.method private sendSuccessToListener(Landroid/os/Bundle;)V
    .registers 4
    .param p1, "values"    # Landroid/os/Bundle;

    .prologue
    .line 307
    iget-object v0, p0, Lcom/facebook/widget/WebDialog;->onCompleteListener:Lcom/facebook/widget/WebDialog$OnCompleteListener;

    if-eqz v0, :cond_11

    iget-boolean v0, p0, Lcom/facebook/widget/WebDialog;->listenerCalled:Z

    if-nez v0, :cond_11

    .line 308
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/facebook/widget/WebDialog;->listenerCalled:Z

    .line 309
    iget-object v0, p0, Lcom/facebook/widget/WebDialog;->onCompleteListener:Lcom/facebook/widget/WebDialog$OnCompleteListener;

    const/4 v1, 0x0

    invoke-interface {v0, p1, v1}, Lcom/facebook/widget/WebDialog$OnCompleteListener;->onComplete(Landroid/os/Bundle;Lcom/facebook/FacebookException;)V

    .line 311
    :cond_11
    return-void
.end method

.method private setUpWebView(I)V
    .registers 9
    .param p1, "margin"    # I
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "SetJavaScriptEnabled"
        }
    .end annotation

    .prologue
    const v6, 0x106000d

    const/4 v5, -0x1

    const/4 v4, 0x0

    .line 350
    new-instance v0, Landroid/widget/LinearLayout;

    invoke-virtual {p0}, Lcom/facebook/widget/WebDialog;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 351
    .local v0, "webViewContainer":Landroid/widget/LinearLayout;
    new-instance v1, Landroid/webkit/WebView;

    invoke-virtual {p0}, Lcom/facebook/widget/WebDialog;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-direct {v1, v2}, Landroid/webkit/WebView;-><init>(Landroid/content/Context;)V

    iput-object v1, p0, Lcom/facebook/widget/WebDialog;->webView:Landroid/webkit/WebView;

    .line 352
    iget-object v1, p0, Lcom/facebook/widget/WebDialog;->webView:Landroid/webkit/WebView;

    invoke-virtual {v1, v4}, Landroid/webkit/WebView;->setVerticalScrollBarEnabled(Z)V

    .line 353
    iget-object v1, p0, Lcom/facebook/widget/WebDialog;->webView:Landroid/webkit/WebView;

    invoke-virtual {v1, v4}, Landroid/webkit/WebView;->setHorizontalScrollBarEnabled(Z)V

    .line 354
    iget-object v1, p0, Lcom/facebook/widget/WebDialog;->webView:Landroid/webkit/WebView;

    new-instance v2, Lcom/facebook/widget/WebDialog$DialogWebViewClient;

    const/4 v3, 0x0

    invoke-direct {v2, p0, v3}, Lcom/facebook/widget/WebDialog$DialogWebViewClient;-><init>(Lcom/facebook/widget/WebDialog;Lcom/facebook/widget/WebDialog$DialogWebViewClient;)V

    invoke-virtual {v1, v2}, Landroid/webkit/WebView;->setWebViewClient(Landroid/webkit/WebViewClient;)V

    .line 355
    iget-object v1, p0, Lcom/facebook/widget/WebDialog;->webView:Landroid/webkit/WebView;

    invoke-virtual {v1}, Landroid/webkit/WebView;->getSettings()Landroid/webkit/WebSettings;

    move-result-object v1

    const/4 v2, 0x1

    invoke-virtual {v1, v2}, Landroid/webkit/WebSettings;->setJavaScriptEnabled(Z)V

    .line 356
    iget-object v1, p0, Lcom/facebook/widget/WebDialog;->webView:Landroid/webkit/WebView;

    iget-object v2, p0, Lcom/facebook/widget/WebDialog;->url:Ljava/lang/String;

    invoke-virtual {v1, v2}, Landroid/webkit/WebView;->loadUrl(Ljava/lang/String;)V

    .line 357
    iget-object v1, p0, Lcom/facebook/widget/WebDialog;->webView:Landroid/webkit/WebView;

    new-instance v2, Landroid/widget/FrameLayout$LayoutParams;

    .line 358
    invoke-direct {v2, v5, v5}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    .line 357
    invoke-virtual {v1, v2}, Landroid/webkit/WebView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 359
    iget-object v1, p0, Lcom/facebook/widget/WebDialog;->webView:Landroid/webkit/WebView;

    const/4 v2, 0x4

    invoke-virtual {v1, v2}, Landroid/webkit/WebView;->setVisibility(I)V

    .line 360
    iget-object v1, p0, Lcom/facebook/widget/WebDialog;->webView:Landroid/webkit/WebView;

    invoke-virtual {v1}, Landroid/webkit/WebView;->getSettings()Landroid/webkit/WebSettings;

    move-result-object v1

    invoke-virtual {v1, v4}, Landroid/webkit/WebSettings;->setSavePassword(Z)V

    .line 361
    iget-object v1, p0, Lcom/facebook/widget/WebDialog;->webView:Landroid/webkit/WebView;

    invoke-virtual {v1}, Landroid/webkit/WebView;->getSettings()Landroid/webkit/WebSettings;

    move-result-object v1

    invoke-virtual {v1, v4}, Landroid/webkit/WebSettings;->setSaveFormData(Z)V

    .line 363
    invoke-virtual {v0, p1, p1, p1, p1}, Landroid/widget/LinearLayout;->setPadding(IIII)V

    .line 364
    iget-object v1, p0, Lcom/facebook/widget/WebDialog;->webView:Landroid/webkit/WebView;

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 365
    invoke-virtual {p0}, Lcom/facebook/widget/WebDialog;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-virtual {v1, v6}, Landroid/content/res/Resources;->getColor(I)I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setBackgroundColor(I)V

    .line 366
    iget-object v1, p0, Lcom/facebook/widget/WebDialog;->contentFrameLayout:Landroid/widget/FrameLayout;

    invoke-virtual {p0}, Lcom/facebook/widget/WebDialog;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-virtual {v2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    invoke-virtual {v2, v6}, Landroid/content/res/Resources;->getColor(I)I

    move-result v2

    invoke-virtual {v1, v2}, Landroid/widget/FrameLayout;->setBackgroundColor(I)V

    .line 367
    iget-object v1, p0, Lcom/facebook/widget/WebDialog;->contentFrameLayout:Landroid/widget/FrameLayout;

    invoke-virtual {v1, v0}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;)V

    .line 368
    return-void
.end method


# virtual methods
.method public dismiss()V
    .registers 2

    .prologue
    .line 183
    iget-object v0, p0, Lcom/facebook/widget/WebDialog;->webView:Landroid/webkit/WebView;

    if-eqz v0, :cond_9

    .line 184
    iget-object v0, p0, Lcom/facebook/widget/WebDialog;->webView:Landroid/webkit/WebView;

    invoke-virtual {v0}, Landroid/webkit/WebView;->stopLoading()V

    .line 186
    :cond_9
    iget-boolean v0, p0, Lcom/facebook/widget/WebDialog;->isDetached:Z

    if-nez v0, :cond_1d

    .line 187
    iget-object v0, p0, Lcom/facebook/widget/WebDialog;->spinner:Landroid/app/ProgressDialog;

    invoke-virtual {v0}, Landroid/app/ProgressDialog;->isShowing()Z

    move-result v0

    if-eqz v0, :cond_1a

    .line 188
    iget-object v0, p0, Lcom/facebook/widget/WebDialog;->spinner:Landroid/app/ProgressDialog;

    invoke-virtual {v0}, Landroid/app/ProgressDialog;->dismiss()V

    .line 190
    :cond_1a
    invoke-super {p0}, Landroid/app/Dialog;->dismiss()V

    .line 192
    :cond_1d
    return-void
.end method

.method public onAttachedToWindow()V
    .registers 2

    .prologue
    .line 202
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/facebook/widget/WebDialog;->isDetached:Z

    .line 203
    invoke-super {p0}, Landroid/app/Dialog;->onAttachedToWindow()V

    .line 204
    return-void
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .registers 8
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    const/4 v5, 0x1

    const/4 v4, -0x2

    .line 208
    invoke-super {p0, p1}, Landroid/app/Dialog;->onCreate(Landroid/os/Bundle;)V

    .line 210
    new-instance v1, Lcom/facebook/widget/WebDialog$1;

    invoke-direct {v1, p0}, Lcom/facebook/widget/WebDialog$1;-><init>(Lcom/facebook/widget/WebDialog;)V

    invoke-virtual {p0, v1}, Lcom/facebook/widget/WebDialog;->setOnCancelListener(Landroid/content/DialogInterface$OnCancelListener;)V

    .line 217
    new-instance v1, Landroid/app/ProgressDialog;

    invoke-virtual {p0}, Lcom/facebook/widget/WebDialog;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-direct {v1, v2}, Landroid/app/ProgressDialog;-><init>(Landroid/content/Context;)V

    iput-object v1, p0, Lcom/facebook/widget/WebDialog;->spinner:Landroid/app/ProgressDialog;

    .line 218
    iget-object v1, p0, Lcom/facebook/widget/WebDialog;->spinner:Landroid/app/ProgressDialog;

    invoke-virtual {v1, v5}, Landroid/app/ProgressDialog;->requestWindowFeature(I)Z

    .line 219
    iget-object v1, p0, Lcom/facebook/widget/WebDialog;->spinner:Landroid/app/ProgressDialog;

    invoke-virtual {p0}, Lcom/facebook/widget/WebDialog;->getContext()Landroid/content/Context;

    move-result-object v2

    sget v3, Lcom/behance/sdk/R$string;->com_facebook_loading:I

    invoke-virtual {v2, v3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/app/ProgressDialog;->setMessage(Ljava/lang/CharSequence;)V

    .line 220
    iget-object v1, p0, Lcom/facebook/widget/WebDialog;->spinner:Landroid/app/ProgressDialog;

    new-instance v2, Lcom/facebook/widget/WebDialog$2;

    invoke-direct {v2, p0}, Lcom/facebook/widget/WebDialog$2;-><init>(Lcom/facebook/widget/WebDialog;)V

    invoke-virtual {v1, v2}, Landroid/app/ProgressDialog;->setOnCancelListener(Landroid/content/DialogInterface$OnCancelListener;)V

    .line 228
    invoke-virtual {p0, v5}, Lcom/facebook/widget/WebDialog;->requestWindowFeature(I)Z

    .line 229
    new-instance v1, Landroid/widget/FrameLayout;

    invoke-virtual {p0}, Lcom/facebook/widget/WebDialog;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-direct {v1, v2}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    iput-object v1, p0, Lcom/facebook/widget/WebDialog;->contentFrameLayout:Landroid/widget/FrameLayout;

    .line 232
    invoke-direct {p0}, Lcom/facebook/widget/WebDialog;->calculateSize()V

    .line 233
    invoke-virtual {p0}, Lcom/facebook/widget/WebDialog;->getWindow()Landroid/view/Window;

    move-result-object v1

    const/16 v2, 0x11

    invoke-virtual {v1, v2}, Landroid/view/Window;->setGravity(I)V

    .line 236
    invoke-virtual {p0}, Lcom/facebook/widget/WebDialog;->getWindow()Landroid/view/Window;

    move-result-object v1

    const/16 v2, 0x10

    invoke-virtual {v1, v2}, Landroid/view/Window;->setSoftInputMode(I)V

    .line 242
    invoke-direct {p0}, Lcom/facebook/widget/WebDialog;->createCrossImage()V

    .line 247
    iget-object v1, p0, Lcom/facebook/widget/WebDialog;->crossImageView:Landroid/widget/ImageView;

    invoke-virtual {v1}, Landroid/widget/ImageView;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v1

    invoke-virtual {v1}, Landroid/graphics/drawable/Drawable;->getIntrinsicWidth()I

    move-result v0

    .line 249
    .local v0, "crossWidth":I
    div-int/lit8 v1, v0, 0x2

    add-int/lit8 v1, v1, 0x1

    invoke-direct {p0, v1}, Lcom/facebook/widget/WebDialog;->setUpWebView(I)V

    .line 254
    iget-object v1, p0, Lcom/facebook/widget/WebDialog;->contentFrameLayout:Landroid/widget/FrameLayout;

    iget-object v2, p0, Lcom/facebook/widget/WebDialog;->crossImageView:Landroid/widget/ImageView;

    new-instance v3, Landroid/view/ViewGroup$LayoutParams;

    .line 255
    invoke-direct {v3, v4, v4}, Landroid/view/ViewGroup$LayoutParams;-><init>(II)V

    .line 254
    invoke-virtual {v1, v2, v3}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 257
    iget-object v1, p0, Lcom/facebook/widget/WebDialog;->contentFrameLayout:Landroid/widget/FrameLayout;

    invoke-virtual {p0, v1}, Lcom/facebook/widget/WebDialog;->setContentView(Landroid/view/View;)V

    .line 258
    return-void
.end method

.method public onDetachedFromWindow()V
    .registers 2

    .prologue
    .line 196
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/facebook/widget/WebDialog;->isDetached:Z

    .line 197
    invoke-super {p0}, Landroid/app/Dialog;->onDetachedFromWindow()V

    .line 198
    return-void
.end method
