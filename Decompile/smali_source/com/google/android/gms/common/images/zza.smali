.class public abstract Lcom/google/android/gms/common/images/zza;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/android/gms/common/images/zza$zza;,
        Lcom/google/android/gms/common/images/zza$zzc;
    }
.end annotation


# instance fields
.field final zzabQ:Lcom/google/android/gms/common/images/zza$zza;

.field protected zzabS:I

.field protected zzabU:Lcom/google/android/gms/common/images/ImageManager$OnImageLoadedListener;

.field protected zzabY:I


# direct methods
.method private zza(Landroid/content/Context;Lcom/google/android/gms/internal/zzku;I)Landroid/graphics/drawable/Drawable;
    .registers 8

    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    iget v0, p0, Lcom/google/android/gms/common/images/zza;->zzabY:I

    if-lez v0, :cond_29

    new-instance v2, Lcom/google/android/gms/internal/zzku$zza;

    iget v0, p0, Lcom/google/android/gms/common/images/zza;->zzabY:I

    invoke-direct {v2, p3, v0}, Lcom/google/android/gms/internal/zzku$zza;-><init>(II)V

    invoke-virtual {p2, v2}, Lcom/google/android/gms/internal/zzku;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/graphics/drawable/Drawable;

    if-nez v0, :cond_28

    invoke-virtual {v1, p3}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    iget v3, p0, Lcom/google/android/gms/common/images/zza;->zzabY:I

    and-int/lit8 v3, v3, 0x1

    if-eqz v3, :cond_25

    invoke-virtual {p0, v1, v0}, Lcom/google/android/gms/common/images/zza;->zza(Landroid/content/res/Resources;Landroid/graphics/drawable/Drawable;)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    :cond_25
    invoke-virtual {p2, v2, v0}, Lcom/google/android/gms/internal/zzku;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_28
    :goto_28
    return-object v0

    :cond_29
    invoke-virtual {v1, p3}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    goto :goto_28
.end method


# virtual methods
.method protected zza(Landroid/content/res/Resources;Landroid/graphics/drawable/Drawable;)Landroid/graphics/drawable/Drawable;
    .registers 4

    invoke-static {p1, p2}, Lcom/google/android/gms/internal/zzks;->zza(Landroid/content/res/Resources;Landroid/graphics/drawable/Drawable;)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    return-object v0
.end method

.method zza(Landroid/content/Context;Landroid/graphics/Bitmap;Z)V
    .registers 8

    const/4 v3, 0x1

    invoke-static {p2}, Lcom/google/android/gms/common/internal/zzb;->zzr(Ljava/lang/Object;)V

    iget v0, p0, Lcom/google/android/gms/common/images/zza;->zzabY:I

    and-int/lit8 v0, v0, 0x1

    if-eqz v0, :cond_e

    invoke-static {p2}, Lcom/google/android/gms/internal/zzks;->zza(Landroid/graphics/Bitmap;)Landroid/graphics/Bitmap;

    move-result-object p2

    :cond_e
    new-instance v0, Landroid/graphics/drawable/BitmapDrawable;

    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-direct {v0, v1, p2}, Landroid/graphics/drawable/BitmapDrawable;-><init>(Landroid/content/res/Resources;Landroid/graphics/Bitmap;)V

    iget-object v1, p0, Lcom/google/android/gms/common/images/zza;->zzabU:Lcom/google/android/gms/common/images/ImageManager$OnImageLoadedListener;

    if-eqz v1, :cond_24

    iget-object v1, p0, Lcom/google/android/gms/common/images/zza;->zzabU:Lcom/google/android/gms/common/images/ImageManager$OnImageLoadedListener;

    iget-object v2, p0, Lcom/google/android/gms/common/images/zza;->zzabQ:Lcom/google/android/gms/common/images/zza$zza;

    iget-object v2, v2, Lcom/google/android/gms/common/images/zza$zza;->uri:Landroid/net/Uri;

    invoke-interface {v1, v2, v0, v3}, Lcom/google/android/gms/common/images/ImageManager$OnImageLoadedListener;->onImageLoaded(Landroid/net/Uri;Landroid/graphics/drawable/Drawable;Z)V

    :cond_24
    const/4 v1, 0x0

    invoke-virtual {p0, v0, p3, v1, v3}, Lcom/google/android/gms/common/images/zza;->zza(Landroid/graphics/drawable/Drawable;ZZZ)V

    return-void
.end method

.method zza(Landroid/content/Context;Lcom/google/android/gms/internal/zzku;Z)V
    .registers 8

    const/4 v3, 0x0

    const/4 v0, 0x0

    iget v1, p0, Lcom/google/android/gms/common/images/zza;->zzabS:I

    if-eqz v1, :cond_c

    iget v0, p0, Lcom/google/android/gms/common/images/zza;->zzabS:I

    invoke-direct {p0, p1, p2, v0}, Lcom/google/android/gms/common/images/zza;->zza(Landroid/content/Context;Lcom/google/android/gms/internal/zzku;I)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    :cond_c
    iget-object v1, p0, Lcom/google/android/gms/common/images/zza;->zzabU:Lcom/google/android/gms/common/images/ImageManager$OnImageLoadedListener;

    if-eqz v1, :cond_19

    iget-object v1, p0, Lcom/google/android/gms/common/images/zza;->zzabU:Lcom/google/android/gms/common/images/ImageManager$OnImageLoadedListener;

    iget-object v2, p0, Lcom/google/android/gms/common/images/zza;->zzabQ:Lcom/google/android/gms/common/images/zza$zza;

    iget-object v2, v2, Lcom/google/android/gms/common/images/zza$zza;->uri:Landroid/net/Uri;

    invoke-interface {v1, v2, v0, v3}, Lcom/google/android/gms/common/images/ImageManager$OnImageLoadedListener;->onImageLoaded(Landroid/net/Uri;Landroid/graphics/drawable/Drawable;Z)V

    :cond_19
    invoke-virtual {p0, v0, p3, v3, v3}, Lcom/google/android/gms/common/images/zza;->zza(Landroid/graphics/drawable/Drawable;ZZZ)V

    return-void
.end method

.method protected abstract zza(Landroid/graphics/drawable/Drawable;ZZZ)V
.end method
