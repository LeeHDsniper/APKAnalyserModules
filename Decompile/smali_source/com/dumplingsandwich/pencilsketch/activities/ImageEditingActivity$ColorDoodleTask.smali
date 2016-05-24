.class Lcom/dumplingsandwich/pencilsketch/activities/ImageEditingActivity$ColorDoodleTask;
.super Lcom/dumplingsandwich/pencilsketch/activities/ImageEditingActivity$BaseAsyncTask;
.source "ImageEditingActivity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/dumplingsandwich/pencilsketch/activities/ImageEditingActivity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "ColorDoodleTask"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/dumplingsandwich/pencilsketch/activities/ImageEditingActivity;


# direct methods
.method private constructor <init>(Lcom/dumplingsandwich/pencilsketch/activities/ImageEditingActivity;)V
    .registers 3

    .prologue
    .line 299
    iput-object p1, p0, Lcom/dumplingsandwich/pencilsketch/activities/ImageEditingActivity$ColorDoodleTask;->this$0:Lcom/dumplingsandwich/pencilsketch/activities/ImageEditingActivity;

    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lcom/dumplingsandwich/pencilsketch/activities/ImageEditingActivity$BaseAsyncTask;-><init>(Lcom/dumplingsandwich/pencilsketch/activities/ImageEditingActivity;Lcom/dumplingsandwich/pencilsketch/activities/ImageEditingActivity$1;)V

    return-void
.end method

.method synthetic constructor <init>(Lcom/dumplingsandwich/pencilsketch/activities/ImageEditingActivity;Lcom/dumplingsandwich/pencilsketch/activities/ImageEditingActivity$1;)V
    .registers 3
    .param p1, "x0"    # Lcom/dumplingsandwich/pencilsketch/activities/ImageEditingActivity;
    .param p2, "x1"    # Lcom/dumplingsandwich/pencilsketch/activities/ImageEditingActivity$1;

    .prologue
    .line 299
    invoke-direct {p0, p1}, Lcom/dumplingsandwich/pencilsketch/activities/ImageEditingActivity$ColorDoodleTask;-><init>(Lcom/dumplingsandwich/pencilsketch/activities/ImageEditingActivity;)V

    return-void
.end method


# virtual methods
.method protected varargs doInBackground([Ljava/lang/Void;)Landroid/graphics/Bitmap;
    .registers 5
    .param p1, "option"    # [Ljava/lang/Void;

    .prologue
    .line 302
    iget-object v1, p0, Lcom/dumplingsandwich/pencilsketch/activities/ImageEditingActivity$ColorDoodleTask;->this$0:Lcom/dumplingsandwich/pencilsketch/activities/ImageEditingActivity;

    # getter for: Lcom/dumplingsandwich/pencilsketch/activities/ImageEditingActivity;->grayscaleBaseLayer:Landroid/graphics/Bitmap;
    invoke-static {v1}, Lcom/dumplingsandwich/pencilsketch/activities/ImageEditingActivity;->access$900(Lcom/dumplingsandwich/pencilsketch/activities/ImageEditingActivity;)Landroid/graphics/Bitmap;

    move-result-object v1

    if-nez v1, :cond_13

    .line 304
    iget-object v1, p0, Lcom/dumplingsandwich/pencilsketch/activities/ImageEditingActivity$ColorDoodleTask;->this$0:Lcom/dumplingsandwich/pencilsketch/activities/ImageEditingActivity;

    sget-object v2, Lcom/dumplingsandwich/pencilsketch/activities/ImageEditingActivity;->original:Landroid/graphics/Bitmap;

    invoke-static {v2}, Lcom/dumplingsandwich/pencilsketch/processor/GrayscaleImageProcessor;->grayscaleBaseSketch(Landroid/graphics/Bitmap;)Landroid/graphics/Bitmap;

    move-result-object v2

    # setter for: Lcom/dumplingsandwich/pencilsketch/activities/ImageEditingActivity;->grayscaleBaseLayer:Landroid/graphics/Bitmap;
    invoke-static {v1, v2}, Lcom/dumplingsandwich/pencilsketch/activities/ImageEditingActivity;->access$902(Lcom/dumplingsandwich/pencilsketch/activities/ImageEditingActivity;Landroid/graphics/Bitmap;)Landroid/graphics/Bitmap;

    .line 306
    :cond_13
    iget-object v1, p0, Lcom/dumplingsandwich/pencilsketch/activities/ImageEditingActivity$ColorDoodleTask;->this$0:Lcom/dumplingsandwich/pencilsketch/activities/ImageEditingActivity;

    # getter for: Lcom/dumplingsandwich/pencilsketch/activities/ImageEditingActivity;->hsvPixelsOriginal:[Lcom/dumplingsandwich/pencilsketch/model/HsvPixel;
    invoke-static {v1}, Lcom/dumplingsandwich/pencilsketch/activities/ImageEditingActivity;->access$1000(Lcom/dumplingsandwich/pencilsketch/activities/ImageEditingActivity;)[Lcom/dumplingsandwich/pencilsketch/model/HsvPixel;

    move-result-object v1

    if-nez v1, :cond_26

    .line 308
    iget-object v1, p0, Lcom/dumplingsandwich/pencilsketch/activities/ImageEditingActivity$ColorDoodleTask;->this$0:Lcom/dumplingsandwich/pencilsketch/activities/ImageEditingActivity;

    sget-object v2, Lcom/dumplingsandwich/pencilsketch/activities/ImageEditingActivity;->original:Landroid/graphics/Bitmap;

    invoke-static {v2}, Lcom/dumplingsandwich/pencilsketch/processor/ColorImageProcessor;->getHsvData(Landroid/graphics/Bitmap;)[Lcom/dumplingsandwich/pencilsketch/model/HsvPixel;

    move-result-object v2

    # setter for: Lcom/dumplingsandwich/pencilsketch/activities/ImageEditingActivity;->hsvPixelsOriginal:[Lcom/dumplingsandwich/pencilsketch/model/HsvPixel;
    invoke-static {v1, v2}, Lcom/dumplingsandwich/pencilsketch/activities/ImageEditingActivity;->access$1002(Lcom/dumplingsandwich/pencilsketch/activities/ImageEditingActivity;[Lcom/dumplingsandwich/pencilsketch/model/HsvPixel;)[Lcom/dumplingsandwich/pencilsketch/model/HsvPixel;

    .line 310
    :cond_26
    iget-object v1, p0, Lcom/dumplingsandwich/pencilsketch/activities/ImageEditingActivity$ColorDoodleTask;->this$0:Lcom/dumplingsandwich/pencilsketch/activities/ImageEditingActivity;

    # getter for: Lcom/dumplingsandwich/pencilsketch/activities/ImageEditingActivity;->grayscaleBaseLayer:Landroid/graphics/Bitmap;
    invoke-static {v1}, Lcom/dumplingsandwich/pencilsketch/activities/ImageEditingActivity;->access$900(Lcom/dumplingsandwich/pencilsketch/activities/ImageEditingActivity;)Landroid/graphics/Bitmap;

    move-result-object v1

    invoke-static {v1}, Lcom/dumplingsandwich/pencilsketch/processor/GrayscaleImageProcessor;->grayscaleEdgeSketch(Landroid/graphics/Bitmap;)Landroid/graphics/Bitmap;

    move-result-object v0

    .line 311
    .local v0, "grayscaleEdgeLayer":Landroid/graphics/Bitmap;
    iget-object v1, p0, Lcom/dumplingsandwich/pencilsketch/activities/ImageEditingActivity$ColorDoodleTask;->this$0:Lcom/dumplingsandwich/pencilsketch/activities/ImageEditingActivity;

    # getter for: Lcom/dumplingsandwich/pencilsketch/activities/ImageEditingActivity;->hsvPixelsOriginal:[Lcom/dumplingsandwich/pencilsketch/model/HsvPixel;
    invoke-static {v1}, Lcom/dumplingsandwich/pencilsketch/activities/ImageEditingActivity;->access$1000(Lcom/dumplingsandwich/pencilsketch/activities/ImageEditingActivity;)[Lcom/dumplingsandwich/pencilsketch/model/HsvPixel;

    move-result-object v1

    invoke-static {v1, v0}, Lcom/dumplingsandwich/pencilsketch/processor/ColorImageProcessor;->replaceIlluminationLayer([Lcom/dumplingsandwich/pencilsketch/model/HsvPixel;Landroid/graphics/Bitmap;)Landroid/graphics/Bitmap;

    move-result-object v1

    return-object v1
.end method

.method protected bridge synthetic doInBackground([Ljava/lang/Object;)Ljava/lang/Object;
    .registers 3
    .param p1, "x0"    # [Ljava/lang/Object;

    .prologue
    .line 299
    check-cast p1, [Ljava/lang/Void;

    .end local p1    # "x0":[Ljava/lang/Object;
    invoke-virtual {p0, p1}, Lcom/dumplingsandwich/pencilsketch/activities/ImageEditingActivity$ColorDoodleTask;->doInBackground([Ljava/lang/Void;)Landroid/graphics/Bitmap;

    move-result-object v0

    return-object v0
.end method
