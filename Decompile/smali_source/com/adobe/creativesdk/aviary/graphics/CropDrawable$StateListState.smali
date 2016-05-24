.class Lcom/adobe/creativesdk/aviary/graphics/CropDrawable$StateListState;
.super Ljava/lang/Object;
.source "CropDrawable.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/adobe/creativesdk/aviary/graphics/CropDrawable;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "StateListState"
.end annotation


# instance fields
.field mDrawables:[Ljava/lang/Integer;

.field mNumChildren:I

.field mStateSets:[[I


# direct methods
.method constructor <init>()V
    .registers 3

    .prologue
    const/16 v1, 0xa

    .line 295
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 296
    new-array v0, v1, [[I

    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/graphics/CropDrawable$StateListState;->mStateSets:[[I

    .line 297
    new-array v0, v1, [Ljava/lang/Integer;

    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/graphics/CropDrawable$StateListState;->mDrawables:[Ljava/lang/Integer;

    .line 298
    const/4 v0, 0x0

    iput v0, p0, Lcom/adobe/creativesdk/aviary/graphics/CropDrawable$StateListState;->mNumChildren:I

    .line 299
    return-void
.end method


# virtual methods
.method public final addChild(Ljava/lang/Integer;)I
    .registers 4
    .param p1, "value"    # Ljava/lang/Integer;

    .prologue
    .line 306
    iget v0, p0, Lcom/adobe/creativesdk/aviary/graphics/CropDrawable$StateListState;->mNumChildren:I

    .line 308
    .local v0, "pos":I
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/graphics/CropDrawable$StateListState;->mDrawables:[Ljava/lang/Integer;

    array-length v1, v1

    if-lt v0, v1, :cond_c

    .line 309
    add-int/lit8 v1, v0, 0xa

    invoke-virtual {p0, v0, v1}, Lcom/adobe/creativesdk/aviary/graphics/CropDrawable$StateListState;->growArray(II)V

    .line 312
    :cond_c
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/graphics/CropDrawable$StateListState;->mDrawables:[Ljava/lang/Integer;

    aput-object p1, v1, v0

    .line 313
    iget v1, p0, Lcom/adobe/creativesdk/aviary/graphics/CropDrawable$StateListState;->mNumChildren:I

    add-int/lit8 v1, v1, 0x1

    iput v1, p0, Lcom/adobe/creativesdk/aviary/graphics/CropDrawable$StateListState;->mNumChildren:I

    .line 314
    return v0
.end method

.method addStateSet([ILjava/lang/Integer;)I
    .registers 5
    .param p1, "stateSet"    # [I
    .param p2, "value"    # Ljava/lang/Integer;

    .prologue
    .line 322
    invoke-virtual {p0, p2}, Lcom/adobe/creativesdk/aviary/graphics/CropDrawable$StateListState;->addChild(Ljava/lang/Integer;)I

    move-result v0

    .line 323
    .local v0, "pos":I
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/graphics/CropDrawable$StateListState;->mStateSets:[[I

    aput-object p1, v1, v0

    .line 324
    return v0
.end method

.method public final getChildCount()I
    .registers 2

    .prologue
    .line 318
    iget v0, p0, Lcom/adobe/creativesdk/aviary/graphics/CropDrawable$StateListState;->mNumChildren:I

    return v0
.end method

.method public growArray(II)V
    .registers 7
    .param p1, "oldSize"    # I
    .param p2, "newSize"    # I

    .prologue
    const/4 v3, 0x0

    .line 339
    new-array v0, p2, [Ljava/lang/Integer;

    .line 340
    .local v0, "newDrawables":[Ljava/lang/Integer;
    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/graphics/CropDrawable$StateListState;->mDrawables:[Ljava/lang/Integer;

    invoke-static {v2, v3, v0, v3, p1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 341
    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/graphics/CropDrawable$StateListState;->mDrawables:[Ljava/lang/Integer;

    .line 343
    new-array v1, p2, [[I

    .line 344
    .local v1, "newStateSets":[[I
    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/graphics/CropDrawable$StateListState;->mStateSets:[[I

    invoke-static {v2, v3, v1, v3, p1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 345
    iput-object v1, p0, Lcom/adobe/creativesdk/aviary/graphics/CropDrawable$StateListState;->mStateSets:[[I

    .line 346
    return-void
.end method

.method indexOfStateSet([I)I
    .registers 6
    .param p1, "stateSet"    # [I

    .prologue
    .line 328
    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/graphics/CropDrawable$StateListState;->mStateSets:[[I

    .line 329
    .local v2, "stateSets":[[I
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/graphics/CropDrawable$StateListState;->getChildCount()I

    move-result v1

    .line 330
    .local v1, "n":I
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_7
    if-ge v0, v1, :cond_15

    .line 331
    aget-object v3, v2, v0

    invoke-static {v3, p1}, Landroid/util/StateSet;->stateSetMatches([I[I)Z

    move-result v3

    if-eqz v3, :cond_12

    .line 335
    .end local v0    # "i":I
    :goto_11
    return v0

    .line 330
    .restart local v0    # "i":I
    :cond_12
    add-int/lit8 v0, v0, 0x1

    goto :goto_7

    .line 335
    :cond_15
    const/4 v0, -0x1

    goto :goto_11
.end method
