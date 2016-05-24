.class public final Lcom/google/android/gms/internal/zzdo;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/google/android/gms/internal/zzdg;


# annotations
.annotation runtime Lcom/google/android/gms/internal/zzgk;
.end annotation


# instance fields
.field private final zzxq:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Lcom/google/android/gms/internal/zzip;",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Ljava/util/WeakHashMap;

    invoke-direct {v0}, Ljava/util/WeakHashMap;-><init>()V

    iput-object v0, p0, Lcom/google/android/gms/internal/zzdo;->zzxq:Ljava/util/Map;

    return-void
.end method

.method private static zza(Landroid/content/Context;Ljava/util/Map;Ljava/lang/String;I)I
    .registers 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;",
            "Ljava/lang/String;",
            "I)I"
        }
    .end annotation

    invoke-interface {p1, p2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    if-eqz v0, :cond_14

    :try_start_8
    invoke-static {}, Lcom/google/android/gms/ads/internal/client/zzk;->zzcE()Lcom/google/android/gms/ads/internal/util/client/zza;

    move-result-object v1

    invoke-static {v0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v2

    invoke-virtual {v1, p0, v2}, Lcom/google/android/gms/ads/internal/util/client/zza;->zzb(Landroid/content/Context;I)I
    :try_end_13
    .catch Ljava/lang/NumberFormatException; {:try_start_8 .. :try_end_13} :catch_15

    move-result p3

    :cond_14
    :goto_14
    return p3

    :catch_15
    move-exception v1

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Could not parse "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " in a video GMSG: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/google/android/gms/ads/internal/util/client/zzb;->zzaE(Ljava/lang/String;)V

    goto :goto_14
.end method


# virtual methods
.method public zza(Lcom/google/android/gms/internal/zzip;Ljava/util/Map;)V
    .registers 13
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/android/gms/internal/zzip;",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    const/4 v7, -0x1

    const/4 v8, 0x0

    const-string v0, "action"

    invoke-interface {p2, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    move-object v1, v0

    check-cast v1, Ljava/lang/String;

    if-nez v1, :cond_13

    const-string v0, "Action missing from video GMSG."

    invoke-static {v0}, Lcom/google/android/gms/ads/internal/util/client/zzb;->zzaE(Ljava/lang/String;)V

    :cond_12
    :goto_12
    return-void

    :cond_13
    const/4 v0, 0x3

    invoke-static {v0}, Lcom/google/android/gms/ads/internal/util/client/zzb;->zzM(I)Z

    move-result v0

    if-eqz v0, :cond_48

    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0, p2}, Lorg/json/JSONObject;-><init>(Ljava/util/Map;)V

    const-string v2, "google.afma.Notify_dt"

    invoke-virtual {v0, v2}, Lorg/json/JSONObject;->remove(Ljava/lang/String;)Ljava/lang/Object;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Video GMSG: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v0}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/google/android/gms/ads/internal/util/client/zzb;->zzaC(Ljava/lang/String;)V

    :cond_48
    const-string v0, "background"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_89

    const-string v0, "color"

    invoke-interface {p2, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_64

    const-string v0, "Color parameter missing from color video GMSG."

    invoke-static {v0}, Lcom/google/android/gms/ads/internal/util/client/zzb;->zzaE(Ljava/lang/String;)V

    goto :goto_12

    :cond_64
    :try_start_64
    invoke-static {v0}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    move-result v0

    invoke-interface {p1}, Lcom/google/android/gms/internal/zzip;->zzgQ()Lcom/google/android/gms/ads/internal/overlay/zzd;

    move-result-object v1

    if-eqz v1, :cond_7f

    invoke-virtual {v1}, Lcom/google/android/gms/ads/internal/overlay/zzd;->zzew()Lcom/google/android/gms/ads/internal/overlay/zzk;

    move-result-object v1

    if-eqz v1, :cond_7f

    invoke-virtual {v1, v0}, Lcom/google/android/gms/ads/internal/overlay/zzk;->setBackgroundColor(I)V
    :try_end_77
    .catch Ljava/lang/IllegalArgumentException; {:try_start_64 .. :try_end_77} :catch_78

    goto :goto_12

    :catch_78
    move-exception v0

    const-string v0, "Invalid color parameter in video GMSG."

    invoke-static {v0}, Lcom/google/android/gms/ads/internal/util/client/zzb;->zzaE(Ljava/lang/String;)V

    goto :goto_12

    :cond_7f
    :try_start_7f
    iget-object v1, p0, Lcom/google/android/gms/internal/zzdo;->zzxq:Ljava/util/Map;

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-interface {v1, p1, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_88
    .catch Ljava/lang/IllegalArgumentException; {:try_start_7f .. :try_end_88} :catch_78

    goto :goto_12

    :cond_89
    invoke-interface {p1}, Lcom/google/android/gms/internal/zzip;->zzgQ()Lcom/google/android/gms/ads/internal/overlay/zzd;

    move-result-object v0

    if-nez v0, :cond_96

    const-string v0, "Could not get ad overlay for a video GMSG."

    invoke-static {v0}, Lcom/google/android/gms/ads/internal/util/client/zzb;->zzaE(Ljava/lang/String;)V

    goto/16 :goto_12

    :cond_96
    const-string v2, "new"

    invoke-virtual {v2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    const-string v2, "position"

    invoke-virtual {v2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v6, :cond_a6

    if-eqz v2, :cond_fe

    :cond_a6
    invoke-interface {p1}, Lcom/google/android/gms/internal/zzip;->getContext()Landroid/content/Context;

    move-result-object v4

    const-string v1, "x"

    invoke-static {v4, p2, v1, v8}, Lcom/google/android/gms/internal/zzdo;->zza(Landroid/content/Context;Ljava/util/Map;Ljava/lang/String;I)I

    move-result v1

    const-string v2, "y"

    invoke-static {v4, p2, v2, v8}, Lcom/google/android/gms/internal/zzdo;->zza(Landroid/content/Context;Ljava/util/Map;Ljava/lang/String;I)I

    move-result v2

    const-string v3, "w"

    invoke-static {v4, p2, v3, v7}, Lcom/google/android/gms/internal/zzdo;->zza(Landroid/content/Context;Ljava/util/Map;Ljava/lang/String;I)I

    move-result v3

    const-string v5, "h"

    invoke-static {v4, p2, v5, v7}, Lcom/google/android/gms/internal/zzdo;->zza(Landroid/content/Context;Ljava/util/Map;Ljava/lang/String;I)I

    move-result v4

    :try_start_c2
    const-string v5, "player"

    invoke-interface {p2, v5}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    invoke-static {v5}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I
    :try_end_cd
    .catch Ljava/lang/NumberFormatException; {:try_start_c2 .. :try_end_cd} :catch_f6

    move-result v5

    :goto_ce
    if-eqz v6, :cond_f9

    invoke-virtual {v0}, Lcom/google/android/gms/ads/internal/overlay/zzd;->zzew()Lcom/google/android/gms/ads/internal/overlay/zzk;

    move-result-object v6

    if-nez v6, :cond_f9

    invoke-virtual/range {v0 .. v5}, Lcom/google/android/gms/ads/internal/overlay/zzd;->zza(IIIII)V

    iget-object v1, p0, Lcom/google/android/gms/internal/zzdo;->zzxq:Ljava/util/Map;

    invoke-interface {v1, p1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_12

    iget-object v1, p0, Lcom/google/android/gms/internal/zzdo;->zzxq:Ljava/util/Map;

    invoke-interface {v1, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Integer;

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    invoke-virtual {v0}, Lcom/google/android/gms/ads/internal/overlay/zzd;->zzew()Lcom/google/android/gms/ads/internal/overlay/zzk;

    move-result-object v0

    invoke-virtual {v0, v1}, Lcom/google/android/gms/ads/internal/overlay/zzk;->setBackgroundColor(I)V

    goto/16 :goto_12

    :catch_f6
    move-exception v5

    move v5, v8

    goto :goto_ce

    :cond_f9
    invoke-virtual {v0, v1, v2, v3, v4}, Lcom/google/android/gms/ads/internal/overlay/zzd;->zzd(IIII)V

    goto/16 :goto_12

    :cond_fe
    invoke-virtual {v0}, Lcom/google/android/gms/ads/internal/overlay/zzd;->zzew()Lcom/google/android/gms/ads/internal/overlay/zzk;

    move-result-object v9

    if-nez v9, :cond_109

    invoke-static {p1}, Lcom/google/android/gms/ads/internal/overlay/zzk;->zzd(Lcom/google/android/gms/internal/zzip;)V

    goto/16 :goto_12

    :cond_109
    const-string v0, "click"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_136

    invoke-interface {p1}, Lcom/google/android/gms/internal/zzip;->getContext()Landroid/content/Context;

    move-result-object v0

    const-string v1, "x"

    invoke-static {v0, p2, v1, v8}, Lcom/google/android/gms/internal/zzdo;->zza(Landroid/content/Context;Ljava/util/Map;Ljava/lang/String;I)I

    move-result v2

    const-string v1, "y"

    invoke-static {v0, p2, v1, v8}, Lcom/google/android/gms/internal/zzdo;->zza(Landroid/content/Context;Ljava/util/Map;Ljava/lang/String;I)I

    move-result v3

    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v0

    int-to-float v5, v2

    int-to-float v6, v3

    move-wide v2, v0

    move v4, v8

    move v7, v8

    invoke-static/range {v0 .. v7}, Landroid/view/MotionEvent;->obtain(JJIFFI)Landroid/view/MotionEvent;

    move-result-object v0

    invoke-virtual {v9, v0}, Lcom/google/android/gms/ads/internal/overlay/zzk;->zzd(Landroid/view/MotionEvent;)V

    invoke-virtual {v0}, Landroid/view/MotionEvent;->recycle()V

    goto/16 :goto_12

    :cond_136
    const-string v0, "currentTime"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_175

    const-string v0, "time"

    invoke-interface {p2, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    if-nez v0, :cond_14f

    const-string v0, "Time parameter missing from currentTime video GMSG."

    invoke-static {v0}, Lcom/google/android/gms/ads/internal/util/client/zzb;->zzaE(Ljava/lang/String;)V

    goto/16 :goto_12

    :cond_14f
    :try_start_14f
    invoke-static {v0}, Ljava/lang/Float;->parseFloat(Ljava/lang/String;)F

    move-result v1

    const/high16 v2, 0x447a0000

    mul-float/2addr v1, v2

    float-to-int v1, v1

    invoke-virtual {v9, v1}, Lcom/google/android/gms/ads/internal/overlay/zzk;->seekTo(I)V
    :try_end_15a
    .catch Ljava/lang/NumberFormatException; {:try_start_14f .. :try_end_15a} :catch_15c

    goto/16 :goto_12

    :catch_15c
    move-exception v1

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Could not parse time parameter from currentTime video GMSG: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/google/android/gms/ads/internal/util/client/zzb;->zzaE(Ljava/lang/String;)V

    goto/16 :goto_12

    :cond_175
    const-string v0, "hide"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_183

    const/4 v0, 0x4

    invoke-virtual {v9, v0}, Lcom/google/android/gms/ads/internal/overlay/zzk;->setVisibility(I)V

    goto/16 :goto_12

    :cond_183
    const-string v0, "load"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_190

    invoke-virtual {v9}, Lcom/google/android/gms/ads/internal/overlay/zzk;->zzeP()V

    goto/16 :goto_12

    :cond_190
    const-string v0, "mimetype"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1a5

    const-string v0, "mimetype"

    invoke-interface {p2, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    invoke-virtual {v9, v0}, Lcom/google/android/gms/ads/internal/overlay/zzk;->setMimeType(Ljava/lang/String;)V

    goto/16 :goto_12

    :cond_1a5
    const-string v0, "muted"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1c5

    const-string v0, "muted"

    invoke-interface {p2, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    invoke-static {v0}, Ljava/lang/Boolean;->parseBoolean(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1c0

    invoke-virtual {v9}, Lcom/google/android/gms/ads/internal/overlay/zzk;->zzeq()V

    goto/16 :goto_12

    :cond_1c0
    invoke-virtual {v9}, Lcom/google/android/gms/ads/internal/overlay/zzk;->zzer()V

    goto/16 :goto_12

    :cond_1c5
    const-string v0, "pause"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1d2

    invoke-virtual {v9}, Lcom/google/android/gms/ads/internal/overlay/zzk;->pause()V

    goto/16 :goto_12

    :cond_1d2
    const-string v0, "play"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1df

    invoke-virtual {v9}, Lcom/google/android/gms/ads/internal/overlay/zzk;->play()V

    goto/16 :goto_12

    :cond_1df
    const-string v0, "show"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1ec

    invoke-virtual {v9, v8}, Lcom/google/android/gms/ads/internal/overlay/zzk;->setVisibility(I)V

    goto/16 :goto_12

    :cond_1ec
    const-string v0, "src"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_201

    const-string v0, "src"

    invoke-interface {p2, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    invoke-virtual {v9, v0}, Lcom/google/android/gms/ads/internal/overlay/zzk;->zzak(Ljava/lang/String;)V

    goto/16 :goto_12

    :cond_201
    const-string v0, "volume"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_23c

    const-string v0, "volume"

    invoke-interface {p2, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    if-nez v0, :cond_21a

    const-string v0, "Level parameter missing from volume video GMSG."

    invoke-static {v0}, Lcom/google/android/gms/ads/internal/util/client/zzb;->zzaE(Ljava/lang/String;)V

    goto/16 :goto_12

    :cond_21a
    :try_start_21a
    invoke-static {v0}, Ljava/lang/Float;->parseFloat(Ljava/lang/String;)F

    move-result v1

    invoke-virtual {v9, v1}, Lcom/google/android/gms/ads/internal/overlay/zzk;->zza(F)V
    :try_end_221
    .catch Ljava/lang/NumberFormatException; {:try_start_21a .. :try_end_221} :catch_223

    goto/16 :goto_12

    :catch_223
    move-exception v1

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Could not parse volume parameter from volume video GMSG: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/google/android/gms/ads/internal/util/client/zzb;->zzaE(Ljava/lang/String;)V

    goto/16 :goto_12

    :cond_23c
    const-string v0, "watermark"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_249

    invoke-virtual {v9}, Lcom/google/android/gms/ads/internal/overlay/zzk;->zzeQ()V

    goto/16 :goto_12

    :cond_249
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Unknown video action: "

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/google/android/gms/ads/internal/util/client/zzb;->zzaE(Ljava/lang/String;)V

    goto/16 :goto_12
.end method
