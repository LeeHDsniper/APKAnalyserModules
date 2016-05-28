.class public Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaHD;
.super Ljava/lang/Object;
.source "MoaHD.java"

# interfaces
.implements Ljava/io/Serializable;


# static fields
.field private static final serialVersionUID:J = 0x763fe74a7ec80b0fL


# instance fields
.field private disposed:Z

.field private m_ptr:J


# direct methods
.method public constructor <init>()V
    .registers 3

    .prologue
    .line 51
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 52
    invoke-direct {p0}, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaHD;->m_nativeCtor()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaHD;->m_ptr:J

    .line 53
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaHD;->disposed:Z

    .line 54
    return-void
.end method

.method static native m_getOriginalEnabled(J)Z
.end method

.method private native m_height(J)I
.end method

.method private native m_nativeApplyActions(JLjava/lang/String;)V
.end method

.method private native m_nativeCtor()J
.end method

.method private native m_nativeDispose(J)V
.end method

.method private native m_nativeIsLoaded(J)Z
.end method

.method private native m_nativeIsValid(J)Z
.end method

.method private native m_nativeLoad(JI)I
.end method

.method private native m_nativeLoad(JLjava/io/FileDescriptor;)I
.end method

.method private native m_nativeLoad(JLjava/lang/String;)I
.end method

.method private native m_nativeSave(JLjava/lang/String;)I
.end method

.method private native m_nativeSaveWithQualityAndConfig(JLjava/lang/String;II)I
.end method

.method private native m_nativeUnload(J)I
.end method

.method static native m_revert(J)I
.end method

.method static native m_setMaxMegaPixels(JI)V
.end method

.method static native m_setOriginalEnabled(JZ)V
.end method

.method private native m_width(J)I
.end method

.method static nativeFormat(Landroid/graphics/Bitmap$CompressFormat;)I
    .registers 4
    .param p0, "format"    # Landroid/graphics/Bitmap$CompressFormat;

    .prologue
    const/4 v0, 0x0

    .line 213
    sget-object v1, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaHD$1;->$SwitchMap$android$graphics$Bitmap$CompressFormat:[I

    invoke-virtual {p0}, Landroid/graphics/Bitmap$CompressFormat;->ordinal()I

    move-result v2

    aget v1, v1, v2

    packed-switch v1, :pswitch_data_10

    .line 219
    :goto_c
    :pswitch_c
    return v0

    .line 217
    :pswitch_d
    const/4 v0, 0x1

    goto :goto_c

    .line 213
    nop

    :pswitch_data_10
    .packed-switch 0x1
        :pswitch_c
        :pswitch_d
    .end packed-switch
.end method


# virtual methods
.method public applyActions(Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaActionList;)V
    .registers 3
    .param p1, "actions"    # Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaActionList;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    .line 173
    invoke-static {p1}, Lcom/adobe/creativesdk/aviary/internal/headless/filters/NativeFilterProxy;->encodeActions(Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaActionList;)Ljava/lang/String;

    move-result-object v0

    .line 174
    .local v0, "string":Ljava/lang/String;
    invoke-virtual {p0, v0}, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaHD;->applyActions(Ljava/lang/String;)V

    .line 175
    return-void
.end method

.method public applyActions(Ljava/lang/String;)V
    .registers 4
    .param p1, "actions"    # Ljava/lang/String;

    .prologue
    .line 161
    iget-wide v0, p0, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaHD;->m_ptr:J

    invoke-direct {p0, v0, v1, p1}, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaHD;->m_nativeApplyActions(JLjava/lang/String;)V

    .line 162
    return-void
.end method

.method public dispose()V
    .registers 3

    .prologue
    .line 261
    iget-wide v0, p0, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaHD;->m_ptr:J

    invoke-direct {p0, v0, v1}, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaHD;->m_nativeDispose(J)V

    .line 262
    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaHD;->m_ptr:J

    .line 263
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaHD;->disposed:Z

    .line 264
    return-void
.end method

.method public getOriginalEnabled()Z
    .registers 3

    .prologue
    .line 296
    iget-wide v0, p0, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaHD;->m_ptr:J

    invoke-static {v0, v1}, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaHD;->m_getOriginalEnabled(J)Z

    move-result v0

    return v0
.end method

.method public isLoaded()Z
    .registers 3

    .prologue
    .line 80
    iget-wide v0, p0, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaHD;->m_ptr:J

    invoke-direct {p0, v0, v1}, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaHD;->m_nativeIsLoaded(J)Z

    move-result v0

    return v0
.end method

.method public load(Ljava/io/FileDescriptor;)V
    .registers 6
    .param p1, "file"    # Ljava/io/FileDescriptor;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/adobe/creativesdk/aviary/internal/headless/AdobeImageExecutionException;
        }
    .end annotation

    .prologue
    .line 136
    iget-wide v2, p0, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaHD;->m_ptr:J

    invoke-direct {p0, v2, v3, p1}, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaHD;->m_nativeLoad(JLjava/io/FileDescriptor;)I

    move-result v0

    .line 137
    .local v0, "code":I
    if-lez v0, :cond_d

    .line 138
    invoke-static {v0}, Lcom/adobe/creativesdk/aviary/internal/headless/AdobeImageExecutionException;->fromInt(I)Lcom/adobe/creativesdk/aviary/internal/headless/AdobeImageExecutionException;

    move-result-object v1

    throw v1

    .line 140
    :cond_d
    return-void
.end method

.method public load(Ljava/lang/String;)V
    .registers 6
    .param p1, "path"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/adobe/creativesdk/aviary/internal/headless/AdobeImageExecutionException;
        }
    .end annotation

    .prologue
    .line 98
    iget-wide v2, p0, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaHD;->m_ptr:J

    invoke-direct {p0, v2, v3, p1}, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaHD;->m_nativeLoad(JLjava/lang/String;)I

    move-result v0

    .line 99
    .local v0, "code":I
    if-lez v0, :cond_d

    .line 100
    invoke-static {v0}, Lcom/adobe/creativesdk/aviary/internal/headless/AdobeImageExecutionException;->fromInt(I)Lcom/adobe/creativesdk/aviary/internal/headless/AdobeImageExecutionException;

    move-result-object v1

    throw v1

    .line 102
    :cond_d
    return-void
.end method

.method public revert()V
    .registers 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/adobe/creativesdk/aviary/internal/headless/AdobeImageExecutionException;
        }
    .end annotation

    .prologue
    .line 109
    iget-wide v2, p0, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaHD;->m_ptr:J

    invoke-static {v2, v3}, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaHD;->m_revert(J)I

    move-result v0

    .line 110
    .local v0, "code":I
    if-lez v0, :cond_d

    .line 111
    invoke-static {v0}, Lcom/adobe/creativesdk/aviary/internal/headless/AdobeImageExecutionException;->fromInt(I)Lcom/adobe/creativesdk/aviary/internal/headless/AdobeImageExecutionException;

    move-result-object v1

    throw v1

    .line 113
    :cond_d
    return-void
.end method

.method public save(Ljava/lang/String;ILandroid/graphics/Bitmap$CompressFormat;)V
    .registers 11
    .param p1, "path"    # Ljava/lang/String;
    .param p2, "quality"    # I
    .param p3, "format"    # Landroid/graphics/Bitmap$CompressFormat;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/adobe/creativesdk/aviary/internal/headless/AdobeImageExecutionException;
        }
    .end annotation

    .prologue
    .line 199
    iget-wide v2, p0, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaHD;->m_ptr:J

    invoke-static {p3}, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaHD;->nativeFormat(Landroid/graphics/Bitmap$CompressFormat;)I

    move-result v6

    move-object v1, p0

    move-object v4, p1

    move v5, p2

    invoke-direct/range {v1 .. v6}, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaHD;->m_nativeSaveWithQualityAndConfig(JLjava/lang/String;II)I

    move-result v0

    .line 200
    .local v0, "code":I
    if-lez v0, :cond_14

    .line 201
    invoke-static {v0}, Lcom/adobe/creativesdk/aviary/internal/headless/AdobeImageExecutionException;->fromInt(I)Lcom/adobe/creativesdk/aviary/internal/headless/AdobeImageExecutionException;

    move-result-object v1

    throw v1

    .line 203
    :cond_14
    return-void
.end method

.method public setOriginalEnabled(Z)V
    .registers 4
    .param p1, "enabled"    # Z

    .prologue
    .line 305
    iget-wide v0, p0, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaHD;->m_ptr:J

    invoke-static {v0, v1, p1}, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaHD;->m_setOriginalEnabled(JZ)V

    .line 306
    return-void
.end method

.method public unload()V
    .registers 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/adobe/creativesdk/aviary/internal/headless/AdobeImageExecutionException;
        }
    .end annotation

    .prologue
    .line 148
    iget-wide v2, p0, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaHD;->m_ptr:J

    invoke-direct {p0, v2, v3}, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaHD;->m_nativeUnload(J)I

    move-result v0

    .line 149
    .local v0, "code":I
    if-lez v0, :cond_d

    .line 150
    invoke-static {v0}, Lcom/adobe/creativesdk/aviary/internal/headless/AdobeImageExecutionException;->fromInt(I)Lcom/adobe/creativesdk/aviary/internal/headless/AdobeImageExecutionException;

    move-result-object v1

    throw v1

    .line 152
    :cond_d
    return-void
.end method
