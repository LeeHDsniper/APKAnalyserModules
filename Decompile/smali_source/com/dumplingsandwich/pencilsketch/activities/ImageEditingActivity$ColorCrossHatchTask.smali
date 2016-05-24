.class Lcom/dumplingsandwich/pencilsketch/activities/ImageEditingActivity$ColorCrossHatchTask;
.super Lcom/dumplingsandwich/pencilsketch/activities/ImageEditingActivity$BaseAsyncTask;
.source "ImageEditingActivity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/dumplingsandwich/pencilsketch/activities/ImageEditingActivity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "ColorCrossHatchTask"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/dumplingsandwich/pencilsketch/activities/ImageEditingActivity;


# direct methods
.method private constructor <init>(Lcom/dumplingsandwich/pencilsketch/activities/ImageEditingActivity;)V
    .registers 3

    .prologue
    .line 315
    iput-object p1, p0, Lcom/dumplingsandwich/pencilsketch/activities/ImageEditingActivity$ColorCrossHatchTask;->this$0:Lcom/dumplingsandwich/pencilsketch/activities/ImageEditingActivity;

    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lcom/dumplingsandwich/pencilsketch/activities/ImageEditingActivity$BaseAsyncTask;-><init>(Lcom/dumplingsandwich/pencilsketch/activities/ImageEditingActivity;Lcom/dumplingsandwich/pencilsketch/activities/ImageEditingActivity$1;)V

    return-void
.end method

.method synthetic constructor <init>(Lcom/dumplingsandwich/pencilsketch/activities/ImageEditingActivity;Lcom/dumplingsandwich/pencilsketch/activities/ImageEditingActivity$1;)V
    .registers 3
    .param p1, "x0"    # Lcom/dumplingsandwich/pencilsketch/activities/ImageEditingActivity;
    .param p2, "x1"    # Lcom/dumplingsandwich/pencilsketch/activities/ImageEditingActivity$1;

    .prologue
    .line 315
    invoke-direct {p0, p1}, Lcom/dumplingsandwich/pencilsketch/activities/ImageEditingActivity$ColorCrossHatchTask;-><init>(Lcom/dumplingsandwich/pencilsketch/activities/ImageEditingActivity;)V

    return-void
.end method


# virtual methods
.method protected varargs doInBackground([Ljava/lang/Void;)Landroid/graphics/Bitmap;
    .registers 10
    .param p1, "option"    # [Ljava/lang/Void;

    .prologue
    .line 318
    iget-object v6, p0, Lcom/dumplingsandwich/pencilsketch/activities/ImageEditingActivity$ColorCrossHatchTask;->this$0:Lcom/dumplingsandwich/pencilsketch/activities/ImageEditingActivity;

    invoke-virtual {v6}, Lcom/dumplingsandwich/pencilsketch/activities/ImageEditingActivity;->getWindowManager()Landroid/view/WindowManager;

    move-result-object v6

    invoke-interface {v6}, Landroid/view/WindowManager;->getDefaultDisplay()Landroid/view/Display;

    move-result-object v0

    .line 320
    .local v0, "display":Landroid/view/Display;
    new-instance v5, Landroid/graphics/Point;

    invoke-direct {v5}, Landroid/graphics/Point;-><init>()V

    .line 321
    .local v5, "size":Landroid/graphics/Point;
    invoke-virtual {v0, v5}, Landroid/view/Display;->getSize(Landroid/graphics/Point;)V

    .line 322
    iget v4, v5, Landroid/graphics/Point;->x:I

    .line 323
    .local v4, "screenWidth":I
    iget v3, v5, Landroid/graphics/Point;->y:I

    .line 325
    .local v3, "screenHeight":I
    iget-object v6, p0, Lcom/dumplingsandwich/pencilsketch/activities/ImageEditingActivity$ColorCrossHatchTask;->this$0:Lcom/dumplingsandwich/pencilsketch/activities/ImageEditingActivity;

    invoke-virtual {v6}, Lcom/dumplingsandwich/pencilsketch/activities/ImageEditingActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v6

    const v7, 0x7f020180

    invoke-static {v6, v7, v4, v3}, Lcom/dumplingsandwich/pencilsketch/utils/BitmapUtils;->decodeResource(Landroid/content/res/Resources;III)Landroid/graphics/Bitmap;

    move-result-object v2

    .line 326
    .local v2, "mask":Landroid/graphics/Bitmap;
    sget-object v6, Lcom/dumplingsandwich/pencilsketch/activities/ImageEditingActivity;->original:Landroid/graphics/Bitmap;

    const v7, 0x3f333333

    invoke-static {v6, v2, v7}, Lcom/dumplingsandwich/pencilsketch/processor/GrayscaleImageProcessor;->grayscaleCrossHatchSketch(Landroid/graphics/Bitmap;Landroid/graphics/Bitmap;F)Landroid/graphics/Bitmap;

    move-result-object v1

    .line 327
    .local v1, "grayscaleCrossHatchLayer":Landroid/graphics/Bitmap;
    invoke-virtual {v2}, Landroid/graphics/Bitmap;->recycle()V

    .line 329
    iget-object v6, p0, Lcom/dumplingsandwich/pencilsketch/activities/ImageEditingActivity$ColorCrossHatchTask;->this$0:Lcom/dumplingsandwich/pencilsketch/activities/ImageEditingActivity;

    # getter for: Lcom/dumplingsandwich/pencilsketch/activities/ImageEditingActivity;->hsvPixelsOriginal:[Lcom/dumplingsandwich/pencilsketch/model/HsvPixel;
    invoke-static {v6}, Lcom/dumplingsandwich/pencilsketch/activities/ImageEditingActivity;->access$1000(Lcom/dumplingsandwich/pencilsketch/activities/ImageEditingActivity;)[Lcom/dumplingsandwich/pencilsketch/model/HsvPixel;

    move-result-object v6

    if-nez v6, :cond_42

    .line 331
    iget-object v6, p0, Lcom/dumplingsandwich/pencilsketch/activities/ImageEditingActivity$ColorCrossHatchTask;->this$0:Lcom/dumplingsandwich/pencilsketch/activities/ImageEditingActivity;

    sget-object v7, Lcom/dumplingsandwich/pencilsketch/activities/ImageEditingActivity;->original:Landroid/graphics/Bitmap;

    invoke-static {v7}, Lcom/dumplingsandwich/pencilsketch/processor/ColorImageProcessor;->getHsvData(Landroid/graphics/Bitmap;)[Lcom/dumplingsandwich/pencilsketch/model/HsvPixel;

    move-result-object v7

    # setter for: Lcom/dumplingsandwich/pencilsketch/activities/ImageEditingActivity;->hsvPixelsOriginal:[Lcom/dumplingsandwich/pencilsketch/model/HsvPixel;
    invoke-static {v6, v7}, Lcom/dumplingsandwich/pencilsketch/activities/ImageEditingActivity;->access$1002(Lcom/dumplingsandwich/pencilsketch/activities/ImageEditingActivity;[Lcom/dumplingsandwich/pencilsketch/model/HsvPixel;)[Lcom/dumplingsandwich/pencilsketch/model/HsvPixel;

    .line 333
    :cond_42
    iget-object v6, p0, Lcom/dumplingsandwich/pencilsketch/activities/ImageEditingActivity$ColorCrossHatchTask;->this$0:Lcom/dumplingsandwich/pencilsketch/activities/ImageEditingActivity;

    # getter for: Lcom/dumplingsandwich/pencilsketch/activities/ImageEditingActivity;->hsvPixelsOriginal:[Lcom/dumplingsandwich/pencilsketch/model/HsvPixel;
    invoke-static {v6}, Lcom/dumplingsandwich/pencilsketch/activities/ImageEditingActivity;->access$1000(Lcom/dumplingsandwich/pencilsketch/activities/ImageEditingActivity;)[Lcom/dumplingsandwich/pencilsketch/model/HsvPixel;

    move-result-object v6

    invoke-static {v6, v1}, Lcom/dumplingsandwich/pencilsketch/processor/ColorImageProcessor;->replaceIlluminationLayer([Lcom/dumplingsandwich/pencilsketch/model/HsvPixel;Landroid/graphics/Bitmap;)Landroid/graphics/Bitmap;

    move-result-object v6

    return-object v6
.end method

.method protected bridge synthetic doInBackground([Ljava/lang/Object;)Ljava/lang/Object;
    .registers 3
    .param p1, "x0"    # [Ljava/lang/Object;

    .prologue
    .line 315
    check-cast p1, [Ljava/lang/Void;

    .end local p1    # "x0":[Ljava/lang/Object;
    invoke-virtual {p0, p1}, Lcom/dumplingsandwich/pencilsketch/activities/ImageEditingActivity$ColorCrossHatchTask;->doInBackground([Ljava/lang/Void;)Landroid/graphics/Bitmap;

    move-result-object v0

    return-object v0
.end method
