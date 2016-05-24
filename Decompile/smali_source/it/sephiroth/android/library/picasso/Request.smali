.class public final Lit/sephiroth/android/library/picasso/Request;
.super Ljava/lang/Object;
.source "Request.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lit/sephiroth/android/library/picasso/Request$Builder;
    }
.end annotation


# static fields
.field private static final TOO_LONG_LOG:J


# instance fields
.field public final cache:Lit/sephiroth/android/library/picasso/Cache;

.field public final centerCrop:Z

.field public final centerInside:Z

.field public final config:Landroid/graphics/Bitmap$Config;

.field public final diskCache:Lit/sephiroth/android/library/picasso/Cache;

.field public final hasRotationPivot:Z

.field id:I

.field networkPolicy:I

.field public final onlyScaleDown:Z

.field public final priority:Lit/sephiroth/android/library/picasso/Picasso$Priority;

.field public final resizeByMaxSide:Z

.field public final resourceId:I

.field public final rotationDegrees:F

.field public final rotationPivotX:F

.field public final rotationPivotY:F

.field public final stableKey:Ljava/lang/String;

.field started:J

.field public final targetHeight:I

.field public final targetWidth:I

.field public final transformations:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lit/sephiroth/android/library/picasso/Transformation;",
            ">;"
        }
    .end annotation
.end field

.field public final uri:Landroid/net/Uri;


# direct methods
.method static constructor <clinit>()V
    .registers 4

    .prologue
    .line 29
    sget-object v0, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    const-wide/16 v2, 0x5

    invoke-virtual {v0, v2, v3}, Ljava/util/concurrent/TimeUnit;->toNanos(J)J

    move-result-wide v0

    sput-wide v0, Lit/sephiroth/android/library/picasso/Request;->TOO_LONG_LOG:J

    return-void
.end method

.method private constructor <init>(Landroid/net/Uri;ILjava/lang/String;Ljava/util/List;IIZZZZFFFZLandroid/graphics/Bitmap$Config;Lit/sephiroth/android/library/picasso/Picasso$Priority;Lit/sephiroth/android/library/picasso/Cache;Lit/sephiroth/android/library/picasso/Cache;)V
    .registers 21
    .param p1, "uri"    # Landroid/net/Uri;
    .param p2, "resourceId"    # I
    .param p3, "stableKey"    # Ljava/lang/String;
    .param p5, "targetWidth"    # I
    .param p6, "targetHeight"    # I
    .param p7, "centerCrop"    # Z
    .param p8, "centerInside"    # Z
    .param p9, "onlyScaleDown"    # Z
    .param p10, "resizeByMaxSide"    # Z
    .param p11, "rotationDegrees"    # F
    .param p12, "rotationPivotX"    # F
    .param p13, "rotationPivotY"    # F
    .param p14, "hasRotationPivot"    # Z
    .param p15, "config"    # Landroid/graphics/Bitmap$Config;
    .param p16, "priority"    # Lit/sephiroth/android/library/picasso/Picasso$Priority;
    .param p17, "cache"    # Lit/sephiroth/android/library/picasso/Cache;
    .param p18, "diskCache"    # Lit/sephiroth/android/library/picasso/Cache;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/net/Uri;",
            "I",
            "Ljava/lang/String;",
            "Ljava/util/List",
            "<",
            "Lit/sephiroth/android/library/picasso/Transformation;",
            ">;IIZZZZFFFZ",
            "Landroid/graphics/Bitmap$Config;",
            "Lit/sephiroth/android/library/picasso/Picasso$Priority;",
            "Lit/sephiroth/android/library/picasso/Cache;",
            "Lit/sephiroth/android/library/picasso/Cache;",
            ")V"
        }
    .end annotation

    .prologue
    .line 95
    .local p4, "transformations":Ljava/util/List;, "Ljava/util/List<Lit/sephiroth/android/library/picasso/Transformation;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 96
    iput-object p1, p0, Lit/sephiroth/android/library/picasso/Request;->uri:Landroid/net/Uri;

    .line 97
    iput p2, p0, Lit/sephiroth/android/library/picasso/Request;->resourceId:I

    .line 98
    iput-object p3, p0, Lit/sephiroth/android/library/picasso/Request;->stableKey:Ljava/lang/String;

    .line 99
    if-nez p4, :cond_35

    .line 100
    const/4 v1, 0x0

    iput-object v1, p0, Lit/sephiroth/android/library/picasso/Request;->transformations:Ljava/util/List;

    .line 104
    :goto_e
    iput p5, p0, Lit/sephiroth/android/library/picasso/Request;->targetWidth:I

    .line 105
    iput p6, p0, Lit/sephiroth/android/library/picasso/Request;->targetHeight:I

    .line 106
    iput-boolean p7, p0, Lit/sephiroth/android/library/picasso/Request;->centerCrop:Z

    .line 107
    iput-boolean p8, p0, Lit/sephiroth/android/library/picasso/Request;->centerInside:Z

    .line 108
    iput-boolean p9, p0, Lit/sephiroth/android/library/picasso/Request;->onlyScaleDown:Z

    .line 109
    iput p11, p0, Lit/sephiroth/android/library/picasso/Request;->rotationDegrees:F

    .line 110
    iput p12, p0, Lit/sephiroth/android/library/picasso/Request;->rotationPivotX:F

    .line 111
    iput p13, p0, Lit/sephiroth/android/library/picasso/Request;->rotationPivotY:F

    .line 112
    move/from16 v0, p14

    iput-boolean v0, p0, Lit/sephiroth/android/library/picasso/Request;->hasRotationPivot:Z

    .line 113
    iput-boolean p10, p0, Lit/sephiroth/android/library/picasso/Request;->resizeByMaxSide:Z

    .line 114
    move-object/from16 v0, p15

    iput-object v0, p0, Lit/sephiroth/android/library/picasso/Request;->config:Landroid/graphics/Bitmap$Config;

    .line 115
    move-object/from16 v0, p16

    iput-object v0, p0, Lit/sephiroth/android/library/picasso/Request;->priority:Lit/sephiroth/android/library/picasso/Picasso$Priority;

    .line 116
    move-object/from16 v0, p17

    iput-object v0, p0, Lit/sephiroth/android/library/picasso/Request;->cache:Lit/sephiroth/android/library/picasso/Cache;

    .line 117
    move-object/from16 v0, p18

    iput-object v0, p0, Lit/sephiroth/android/library/picasso/Request;->diskCache:Lit/sephiroth/android/library/picasso/Cache;

    .line 118
    return-void

    .line 102
    :cond_35
    invoke-static {p4}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object v1

    iput-object v1, p0, Lit/sephiroth/android/library/picasso/Request;->transformations:Ljava/util/List;

    goto :goto_e
.end method

.method synthetic constructor <init>(Landroid/net/Uri;ILjava/lang/String;Ljava/util/List;IIZZZZFFFZLandroid/graphics/Bitmap$Config;Lit/sephiroth/android/library/picasso/Picasso$Priority;Lit/sephiroth/android/library/picasso/Cache;Lit/sephiroth/android/library/picasso/Cache;Lit/sephiroth/android/library/picasso/Request$1;)V
    .registers 20
    .param p1, "x0"    # Landroid/net/Uri;
    .param p2, "x1"    # I
    .param p3, "x2"    # Ljava/lang/String;
    .param p4, "x3"    # Ljava/util/List;
    .param p5, "x4"    # I
    .param p6, "x5"    # I
    .param p7, "x6"    # Z
    .param p8, "x7"    # Z
    .param p9, "x8"    # Z
    .param p10, "x9"    # Z
    .param p11, "x10"    # F
    .param p12, "x11"    # F
    .param p13, "x12"    # F
    .param p14, "x13"    # Z
    .param p15, "x14"    # Landroid/graphics/Bitmap$Config;
    .param p16, "x15"    # Lit/sephiroth/android/library/picasso/Picasso$Priority;
    .param p17, "x16"    # Lit/sephiroth/android/library/picasso/Cache;
    .param p18, "x17"    # Lit/sephiroth/android/library/picasso/Cache;
    .param p19, "x18"    # Lit/sephiroth/android/library/picasso/Request$1;

    .prologue
    .line 28
    invoke-direct/range {p0 .. p18}, Lit/sephiroth/android/library/picasso/Request;-><init>(Landroid/net/Uri;ILjava/lang/String;Ljava/util/List;IIZZZZFFFZLandroid/graphics/Bitmap$Config;Lit/sephiroth/android/library/picasso/Picasso$Priority;Lit/sephiroth/android/library/picasso/Cache;Lit/sephiroth/android/library/picasso/Cache;)V

    return-void
.end method


# virtual methods
.method getName()Ljava/lang/String;
    .registers 2

    .prologue
    .line 172
    iget-object v0, p0, Lit/sephiroth/android/library/picasso/Request;->uri:Landroid/net/Uri;

    if-eqz v0, :cond_f

    .line 173
    iget-object v0, p0, Lit/sephiroth/android/library/picasso/Request;->uri:Landroid/net/Uri;

    invoke-virtual {v0}, Landroid/net/Uri;->getPath()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    .line 175
    :goto_e
    return-object v0

    :cond_f
    iget v0, p0, Lit/sephiroth/android/library/picasso/Request;->resourceId:I

    invoke-static {v0}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object v0

    goto :goto_e
.end method

.method hasCustomTransformations()Z
    .registers 2

    .prologue
    .line 191
    iget-object v0, p0, Lit/sephiroth/android/library/picasso/Request;->transformations:Ljava/util/List;

    if-eqz v0, :cond_6

    const/4 v0, 0x1

    :goto_5
    return v0

    :cond_6
    const/4 v0, 0x0

    goto :goto_5
.end method

.method public hasSize()Z
    .registers 2

    .prologue
    .line 179
    iget v0, p0, Lit/sephiroth/android/library/picasso/Request;->targetWidth:I

    if-nez v0, :cond_8

    iget v0, p0, Lit/sephiroth/android/library/picasso/Request;->targetHeight:I

    if-eqz v0, :cond_a

    :cond_8
    const/4 v0, 0x1

    :goto_9
    return v0

    :cond_a
    const/4 v0, 0x0

    goto :goto_9
.end method

.method logId()Ljava/lang/String;
    .registers 8

    .prologue
    const/16 v6, 0x2b

    .line 160
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    move-result-wide v2

    iget-wide v4, p0, Lit/sephiroth/android/library/picasso/Request;->started:J

    sub-long v0, v2, v4

    .line 161
    .local v0, "delta":J
    sget-wide v2, Lit/sephiroth/android/library/picasso/Request;->TOO_LONG_LOG:J

    cmp-long v2, v0, v2

    if-lez v2, :cond_36

    .line 162
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0}, Lit/sephiroth/android/library/picasso/Request;->plainId()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v6}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v2

    sget-object v3, Ljava/util/concurrent/TimeUnit;->NANOSECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-virtual {v3, v0, v1}, Ljava/util/concurrent/TimeUnit;->toSeconds(J)J

    move-result-wide v4

    invoke-virtual {v2, v4, v5}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v2

    const/16 v3, 0x73

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 164
    :goto_35
    return-object v2

    :cond_36
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0}, Lit/sephiroth/android/library/picasso/Request;->plainId()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v6}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v2

    sget-object v3, Ljava/util/concurrent/TimeUnit;->NANOSECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-virtual {v3, v0, v1}, Ljava/util/concurrent/TimeUnit;->toMillis(J)J

    move-result-wide v4

    invoke-virtual {v2, v4, v5}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "ms"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    goto :goto_35
.end method

.method needsMatrixTransform()Z
    .registers 3

    .prologue
    .line 187
    invoke-virtual {p0}, Lit/sephiroth/android/library/picasso/Request;->hasSize()Z

    move-result v0

    if-nez v0, :cond_d

    iget v0, p0, Lit/sephiroth/android/library/picasso/Request;->rotationDegrees:F

    const/4 v1, 0x0

    cmpl-float v0, v0, v1

    if-eqz v0, :cond_f

    :cond_d
    const/4 v0, 0x1

    :goto_e
    return v0

    :cond_f
    const/4 v0, 0x0

    goto :goto_e
.end method

.method needsTransformation()Z
    .registers 2

    .prologue
    .line 183
    invoke-virtual {p0}, Lit/sephiroth/android/library/picasso/Request;->needsMatrixTransform()Z

    move-result v0

    if-nez v0, :cond_c

    invoke-virtual {p0}, Lit/sephiroth/android/library/picasso/Request;->hasCustomTransformations()Z

    move-result v0

    if-eqz v0, :cond_e

    :cond_c
    const/4 v0, 0x1

    :goto_d
    return v0

    :cond_e
    const/4 v0, 0x0

    goto :goto_d
.end method

.method plainId()Ljava/lang/String;
    .registers 3

    .prologue
    .line 168
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "[R"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Lit/sephiroth/android/library/picasso/Request;->id:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const/16 v1, 0x5d

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public toString()Ljava/lang/String;
    .registers 9

    .prologue
    const/16 v7, 0x2c

    const/16 v6, 0x20

    const/16 v5, 0x29

    .line 121
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v2, "Request{"

    invoke-direct {v0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 122
    .local v0, "sb":Ljava/lang/StringBuilder;
    iget v2, p0, Lit/sephiroth/android/library/picasso/Request;->resourceId:I

    if-lez v2, :cond_40

    .line 123
    iget v2, p0, Lit/sephiroth/android/library/picasso/Request;->resourceId:I

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 127
    :goto_16
    iget-object v2, p0, Lit/sephiroth/android/library/picasso/Request;->transformations:Ljava/util/List;

    if-eqz v2, :cond_46

    iget-object v2, p0, Lit/sephiroth/android/library/picasso/Request;->transformations:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->isEmpty()Z

    move-result v2

    if-nez v2, :cond_46

    .line 128
    iget-object v2, p0, Lit/sephiroth/android/library/picasso/Request;->transformations:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_28
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_46

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lit/sephiroth/android/library/picasso/Transformation;

    .line 129
    .local v1, "transformation":Lit/sephiroth/android/library/picasso/Transformation;
    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-interface {v1}, Lit/sephiroth/android/library/picasso/Transformation;->key()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_28

    .line 125
    .end local v1    # "transformation":Lit/sephiroth/android/library/picasso/Transformation;
    :cond_40
    iget-object v2, p0, Lit/sephiroth/android/library/picasso/Request;->uri:Landroid/net/Uri;

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    goto :goto_16

    .line 132
    :cond_46
    iget-object v2, p0, Lit/sephiroth/android/library/picasso/Request;->stableKey:Ljava/lang/String;

    if-eqz v2, :cond_59

    .line 133
    const-string v2, " stableKey("

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lit/sephiroth/android/library/picasso/Request;->stableKey:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v5}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 135
    :cond_59
    iget v2, p0, Lit/sephiroth/android/library/picasso/Request;->targetWidth:I

    if-lez v2, :cond_76

    .line 136
    const-string v2, " resize("

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget v3, p0, Lit/sephiroth/android/library/picasso/Request;->targetWidth:I

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v7}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v2

    iget v3, p0, Lit/sephiroth/android/library/picasso/Request;->targetHeight:I

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v5}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 138
    :cond_76
    iget-boolean v2, p0, Lit/sephiroth/android/library/picasso/Request;->centerCrop:Z

    if-eqz v2, :cond_7f

    .line 139
    const-string v2, " centerCrop"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 141
    :cond_7f
    iget-boolean v2, p0, Lit/sephiroth/android/library/picasso/Request;->centerInside:Z

    if-eqz v2, :cond_88

    .line 142
    const-string v2, " centerInside"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 144
    :cond_88
    iget v2, p0, Lit/sephiroth/android/library/picasso/Request;->rotationDegrees:F

    const/4 v3, 0x0

    cmpl-float v2, v2, v3

    if-eqz v2, :cond_b6

    .line 145
    const-string v2, " rotation("

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget v3, p0, Lit/sephiroth/android/library/picasso/Request;->rotationDegrees:F

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 146
    iget-boolean v2, p0, Lit/sephiroth/android/library/picasso/Request;->hasRotationPivot:Z

    if-eqz v2, :cond_b3

    .line 147
    const-string v2, " @ "

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget v3, p0, Lit/sephiroth/android/library/picasso/Request;->rotationPivotX:F

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v7}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v2

    iget v3, p0, Lit/sephiroth/android/library/picasso/Request;->rotationPivotY:F

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 149
    :cond_b3
    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 151
    :cond_b6
    iget-object v2, p0, Lit/sephiroth/android/library/picasso/Request;->config:Landroid/graphics/Bitmap$Config;

    if-eqz v2, :cond_c3

    .line 152
    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lit/sephiroth/android/library/picasso/Request;->config:Landroid/graphics/Bitmap$Config;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 154
    :cond_c3
    const/16 v2, 0x7d

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 156
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    return-object v2
.end method
