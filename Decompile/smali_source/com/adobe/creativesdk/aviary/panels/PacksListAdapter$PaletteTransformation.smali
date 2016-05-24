.class public Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter$PaletteTransformation;
.super Ljava/lang/Object;
.source "PacksListAdapter.java"

# interfaces
.implements Lit/sephiroth/android/library/picasso/Transformation;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "PaletteTransformation"
.end annotation


# instance fields
.field private final callback:Ljava/lang/ref/SoftReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/SoftReference",
            "<",
            "Landroid/support/v7/graphics/Palette$PaletteAsyncListener;",
            ">;"
        }
    .end annotation
.end field

.field private maxSize:I

.field public palette:Landroid/support/v7/graphics/Palette;


# direct methods
.method public constructor <init>()V
    .registers 2

    .prologue
    .line 597
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 598
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter$PaletteTransformation;->callback:Ljava/lang/ref/SoftReference;

    .line 599
    const/4 v0, -0x1

    iput v0, p0, Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter$PaletteTransformation;->maxSize:I

    .line 600
    return-void
.end method

.method public constructor <init>(Landroid/support/v7/graphics/Palette$PaletteAsyncListener;)V
    .registers 3
    .param p1, "callback"    # Landroid/support/v7/graphics/Palette$PaletteAsyncListener;

    .prologue
    .line 603
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 604
    new-instance v0, Ljava/lang/ref/SoftReference;

    invoke-direct {v0, p1}, Ljava/lang/ref/SoftReference;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter$PaletteTransformation;->callback:Ljava/lang/ref/SoftReference;

    .line 605
    return-void
.end method


# virtual methods
.method public key()Ljava/lang/String;
    .registers 2

    .prologue
    .line 637
    const-string v0, "paletteTransformation"

    return-object v0
.end method

.method public resize(I)V
    .registers 2
    .param p1, "maxSize"    # I

    .prologue
    .line 608
    iput p1, p0, Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter$PaletteTransformation;->maxSize:I

    .line 609
    return-void
.end method

.method public transform(Landroid/graphics/Bitmap;)Landroid/graphics/Bitmap;
    .registers 5
    .param p1, "bitmap"    # Landroid/graphics/Bitmap;

    .prologue
    .line 613
    if-eqz p1, :cond_21

    .line 615
    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter$PaletteTransformation;->callback:Ljava/lang/ref/SoftReference;

    if-eqz v2, :cond_22

    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter$PaletteTransformation;->callback:Ljava/lang/ref/SoftReference;

    invoke-virtual {v2}, Ljava/lang/ref/SoftReference;->get()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/support/v7/graphics/Palette$PaletteAsyncListener;

    move-object v1, v2

    .line 616
    .local v1, "listener":Landroid/support/v7/graphics/Palette$PaletteAsyncListener;
    :goto_f
    invoke-static {p1}, Landroid/support/v7/graphics/Palette;->from(Landroid/graphics/Bitmap;)Landroid/support/v7/graphics/Palette$Builder;

    move-result-object v0

    .line 618
    .local v0, "builder":Landroid/support/v7/graphics/Palette$Builder;
    iget v2, p0, Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter$PaletteTransformation;->maxSize:I

    if-lez v2, :cond_1c

    .line 619
    iget v2, p0, Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter$PaletteTransformation;->maxSize:I

    invoke-virtual {v0, v2}, Landroid/support/v7/graphics/Palette$Builder;->resizeBitmapSize(I)Landroid/support/v7/graphics/Palette$Builder;

    .line 622
    :cond_1c
    if-eqz v1, :cond_24

    .line 623
    invoke-virtual {v0, v1}, Landroid/support/v7/graphics/Palette$Builder;->generate(Landroid/support/v7/graphics/Palette$PaletteAsyncListener;)Landroid/os/AsyncTask;

    .line 628
    .end local v0    # "builder":Landroid/support/v7/graphics/Palette$Builder;
    .end local v1    # "listener":Landroid/support/v7/graphics/Palette$PaletteAsyncListener;
    :cond_21
    :goto_21
    return-object p1

    .line 615
    :cond_22
    const/4 v1, 0x0

    goto :goto_f

    .line 625
    .restart local v0    # "builder":Landroid/support/v7/graphics/Palette$Builder;
    .restart local v1    # "listener":Landroid/support/v7/graphics/Palette$PaletteAsyncListener;
    :cond_24
    invoke-virtual {v0}, Landroid/support/v7/graphics/Palette$Builder;->generate()Landroid/support/v7/graphics/Palette;

    move-result-object v2

    iput-object v2, p0, Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter$PaletteTransformation;->palette:Landroid/support/v7/graphics/Palette;

    goto :goto_21
.end method
