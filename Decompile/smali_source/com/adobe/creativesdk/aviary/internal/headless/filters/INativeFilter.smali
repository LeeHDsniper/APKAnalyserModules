.class public interface abstract Lcom/adobe/creativesdk/aviary/internal/headless/filters/INativeFilter;
.super Ljava/lang/Object;
.source "INativeFilter.java"

# interfaces
.implements Lcom/adobe/creativesdk/aviary/internal/headless/filters/IFilter;


# virtual methods
.method public abstract getActions()Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaActionList;
.end method

.method public abstract prepare(Landroid/graphics/Bitmap;Landroid/graphics/Bitmap;II)Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaResult;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation
.end method
