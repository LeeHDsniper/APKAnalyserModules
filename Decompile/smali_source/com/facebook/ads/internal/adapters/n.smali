.class public Lcom/facebook/ads/internal/adapters/n;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/facebook/ads/internal/adapters/a;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/facebook/ads/internal/adapters/n$a;
    }
.end annotation


# static fields
.field private static final a:Ljava/lang/String;


# instance fields
.field private final A:Ljava/lang/String;

.field private final B:Lcom/facebook/ads/NativeAd$Image;

.field private final C:Ljava/lang/String;

.field private final D:Ljava/lang/String;

.field private final E:Lcom/facebook/ads/internal/adapters/n$a;

.field private final F:Lcom/facebook/ads/NativeAdViewAttributes;

.field private final G:Ljava/lang/String;

.field private H:Z

.field private I:Z

.field private K:J

.field private L:Lcom/facebook/ads/internal/util/b$a;

.field private final b:Landroid/net/Uri;

.field private final c:Ljava/lang/String;

.field private final d:Ljava/lang/String;

.field private final e:Ljava/lang/String;

.field private final f:Ljava/lang/String;

.field private final g:Ljava/lang/String;

.field private final h:Lcom/facebook/ads/NativeAd$Image;

.field private final i:Lcom/facebook/ads/NativeAd$Image;

.field private final j:Lcom/facebook/ads/NativeAd$Rating;

.field private final k:Ljava/lang/String;

.field private final l:Ljava/lang/String;

.field private final m:Ljava/lang/String;

.field private final n:Ljava/lang/String;

.field private final o:Lcom/facebook/ads/internal/util/e;

.field private final p:Ljava/lang/String;

.field private final q:Ljava/util/Collection;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Collection",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private final r:Z

.field private final s:Z

.field private final t:Z

.field private final u:I

.field private final v:I

.field private final w:I

.field private final x:I

.field private final y:Ljava/lang/String;

.field private final z:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    const-class v0, Lcom/facebook/ads/internal/adapters/n;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/facebook/ads/internal/adapters/n;->a:Ljava/lang/String;

    return-void
.end method

.method private constructor <init>(Landroid/net/Uri;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/facebook/ads/NativeAd$Image;Lcom/facebook/ads/NativeAd$Image;Lcom/facebook/ads/NativeAd$Rating;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/facebook/ads/internal/util/e;Ljava/lang/String;Ljava/util/Collection;ZLcom/facebook/ads/NativeAd$Image;Ljava/lang/String;Ljava/lang/String;Lcom/facebook/ads/internal/adapters/n$a;Ljava/lang/String;ZZIILjava/lang/String;Ljava/lang/String;Ljava/lang/String;IILcom/facebook/ads/NativeAdViewAttributes;)V
    .registers 36
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/net/Uri;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Lcom/facebook/ads/NativeAd$Image;",
            "Lcom/facebook/ads/NativeAd$Image;",
            "Lcom/facebook/ads/NativeAd$Rating;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Lcom/facebook/ads/internal/util/e;",
            "Ljava/lang/String;",
            "Ljava/util/Collection",
            "<",
            "Ljava/lang/String;",
            ">;Z",
            "Lcom/facebook/ads/NativeAd$Image;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Lcom/facebook/ads/internal/adapters/n$a;",
            "Ljava/lang/String;",
            "ZZII",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "II",
            "Lcom/facebook/ads/NativeAdViewAttributes;",
            ")V"
        }
    .end annotation

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const-wide/16 v2, 0x0

    iput-wide v2, p0, Lcom/facebook/ads/internal/adapters/n;->K:J

    const/4 v2, 0x0

    iput-object v2, p0, Lcom/facebook/ads/internal/adapters/n;->L:Lcom/facebook/ads/internal/util/b$a;

    iput-object p1, p0, Lcom/facebook/ads/internal/adapters/n;->b:Landroid/net/Uri;

    iput-object p2, p0, Lcom/facebook/ads/internal/adapters/n;->c:Ljava/lang/String;

    iput-object p3, p0, Lcom/facebook/ads/internal/adapters/n;->d:Ljava/lang/String;

    iput-object p4, p0, Lcom/facebook/ads/internal/adapters/n;->e:Ljava/lang/String;

    iput-object p5, p0, Lcom/facebook/ads/internal/adapters/n;->f:Ljava/lang/String;

    iput-object p6, p0, Lcom/facebook/ads/internal/adapters/n;->g:Ljava/lang/String;

    iput-object p7, p0, Lcom/facebook/ads/internal/adapters/n;->h:Lcom/facebook/ads/NativeAd$Image;

    iput-object p8, p0, Lcom/facebook/ads/internal/adapters/n;->i:Lcom/facebook/ads/NativeAd$Image;

    iput-object p9, p0, Lcom/facebook/ads/internal/adapters/n;->j:Lcom/facebook/ads/NativeAd$Rating;

    iput-object p10, p0, Lcom/facebook/ads/internal/adapters/n;->k:Ljava/lang/String;

    iput-object p11, p0, Lcom/facebook/ads/internal/adapters/n;->m:Ljava/lang/String;

    move-object/from16 v0, p12

    iput-object v0, p0, Lcom/facebook/ads/internal/adapters/n;->n:Ljava/lang/String;

    move-object/from16 v0, p13

    iput-object v0, p0, Lcom/facebook/ads/internal/adapters/n;->o:Lcom/facebook/ads/internal/util/e;

    move-object/from16 v0, p14

    iput-object v0, p0, Lcom/facebook/ads/internal/adapters/n;->p:Ljava/lang/String;

    move-object/from16 v0, p15

    iput-object v0, p0, Lcom/facebook/ads/internal/adapters/n;->q:Ljava/util/Collection;

    move/from16 v0, p16

    iput-boolean v0, p0, Lcom/facebook/ads/internal/adapters/n;->r:Z

    move/from16 v0, p22

    iput-boolean v0, p0, Lcom/facebook/ads/internal/adapters/n;->s:Z

    move/from16 v0, p23

    iput-boolean v0, p0, Lcom/facebook/ads/internal/adapters/n;->t:Z

    move-object/from16 v0, p17

    iput-object v0, p0, Lcom/facebook/ads/internal/adapters/n;->B:Lcom/facebook/ads/NativeAd$Image;

    move-object/from16 v0, p18

    iput-object v0, p0, Lcom/facebook/ads/internal/adapters/n;->C:Ljava/lang/String;

    move-object/from16 v0, p19

    iput-object v0, p0, Lcom/facebook/ads/internal/adapters/n;->D:Ljava/lang/String;

    move-object/from16 v0, p20

    iput-object v0, p0, Lcom/facebook/ads/internal/adapters/n;->E:Lcom/facebook/ads/internal/adapters/n$a;

    move-object/from16 v0, p21

    iput-object v0, p0, Lcom/facebook/ads/internal/adapters/n;->l:Ljava/lang/String;

    move/from16 v0, p24

    iput v0, p0, Lcom/facebook/ads/internal/adapters/n;->u:I

    move/from16 v0, p25

    iput v0, p0, Lcom/facebook/ads/internal/adapters/n;->v:I

    move/from16 v0, p29

    iput v0, p0, Lcom/facebook/ads/internal/adapters/n;->w:I

    move/from16 v0, p30

    iput v0, p0, Lcom/facebook/ads/internal/adapters/n;->x:I

    move-object/from16 v0, p26

    iput-object v0, p0, Lcom/facebook/ads/internal/adapters/n;->y:Ljava/lang/String;

    move-object/from16 v0, p27

    iput-object v0, p0, Lcom/facebook/ads/internal/adapters/n;->z:Ljava/lang/String;

    move-object/from16 v0, p28

    iput-object v0, p0, Lcom/facebook/ads/internal/adapters/n;->A:Ljava/lang/String;

    move-object/from16 v0, p31

    iput-object v0, p0, Lcom/facebook/ads/internal/adapters/n;->F:Lcom/facebook/ads/NativeAdViewAttributes;

    invoke-static {}, Ljava/util/UUID;->randomUUID()Ljava/util/UUID;

    move-result-object v2

    invoke-virtual {v2}, Ljava/util/UUID;->toString()Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lcom/facebook/ads/internal/adapters/n;->G:Ljava/lang/String;

    return-void
.end method

.method private B()Z
    .registers 2

    iget-object v0, p0, Lcom/facebook/ads/internal/adapters/n;->c:Ljava/lang/String;

    if-eqz v0, :cond_22

    iget-object v0, p0, Lcom/facebook/ads/internal/adapters/n;->c:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    if-lez v0, :cond_22

    iget-object v0, p0, Lcom/facebook/ads/internal/adapters/n;->f:Ljava/lang/String;

    if-eqz v0, :cond_22

    iget-object v0, p0, Lcom/facebook/ads/internal/adapters/n;->f:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    if-lez v0, :cond_22

    iget-object v0, p0, Lcom/facebook/ads/internal/adapters/n;->h:Lcom/facebook/ads/NativeAd$Image;

    if-eqz v0, :cond_22

    iget-object v0, p0, Lcom/facebook/ads/internal/adapters/n;->i:Lcom/facebook/ads/NativeAd$Image;

    if-eqz v0, :cond_22

    const/4 v0, 0x1

    :goto_21
    return v0

    :cond_22
    const/4 v0, 0x0

    goto :goto_21
.end method

.method public static a(Lorg/json/JSONObject;)Lcom/facebook/ads/internal/adapters/n;
    .registers 35

    if-nez p0, :cond_4

    const/4 v2, 0x0

    :cond_3
    :goto_3
    return-object v2

    :cond_4
    const-string v2, "fbad_command"

    move-object/from16 v0, p0

    invoke-virtual {v0, v2}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v3

    const-string v2, "title"

    move-object/from16 v0, p0

    invoke-virtual {v0, v2}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    const-string v2, "subtitle"

    move-object/from16 v0, p0

    invoke-virtual {v0, v2}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    const-string v2, "body"

    move-object/from16 v0, p0

    invoke-virtual {v0, v2}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    const-string v2, "call_to_action"

    move-object/from16 v0, p0

    invoke-virtual {v0, v2}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    const-string v2, "social_context"

    move-object/from16 v0, p0

    invoke-virtual {v0, v2}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    const-string v2, "icon"

    move-object/from16 v0, p0

    invoke-virtual {v0, v2}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v2

    invoke-static {v2}, Lcom/facebook/ads/NativeAd$Image;->fromJSONObject(Lorg/json/JSONObject;)Lcom/facebook/ads/NativeAd$Image;

    move-result-object v9

    const-string v2, "image"

    move-object/from16 v0, p0

    invoke-virtual {v0, v2}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v2

    invoke-static {v2}, Lcom/facebook/ads/NativeAd$Image;->fromJSONObject(Lorg/json/JSONObject;)Lcom/facebook/ads/NativeAd$Image;

    move-result-object v10

    const-string v2, "star_rating"

    move-object/from16 v0, p0

    invoke-virtual {v0, v2}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v2

    invoke-static {v2}, Lcom/facebook/ads/NativeAd$Rating;->fromJSONObject(Lorg/json/JSONObject;)Lcom/facebook/ads/NativeAd$Rating;

    move-result-object v11

    const-string v2, "impression_report_url"

    move-object/from16 v0, p0

    invoke-virtual {v0, v2}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v12

    const-string v2, "native_view_report_url"

    move-object/from16 v0, p0

    invoke-virtual {v0, v2}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v23

    const-string v2, "click_report_url"

    move-object/from16 v0, p0

    invoke-virtual {v0, v2}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v13

    const-string v2, "used_report_url"

    move-object/from16 v0, p0

    invoke-virtual {v0, v2}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v14

    const-string v2, "manual_imp"

    move-object/from16 v0, p0

    invoke-virtual {v0, v2}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;)Z

    move-result v18

    const-string v2, "enable_view_log"

    move-object/from16 v0, p0

    invoke-virtual {v0, v2}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;)Z

    move-result v24

    const-string v2, "enable_snapshot_log"

    move-object/from16 v0, p0

    invoke-virtual {v0, v2}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;)Z

    move-result v25

    const-string v2, "snapshot_log_delay_second"

    const/4 v15, 0x4

    move-object/from16 v0, p0

    invoke-virtual {v0, v2, v15}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;I)I

    move-result v26

    const-string v2, "snapshot_compress_quality"

    const/4 v15, 0x0

    move-object/from16 v0, p0

    invoke-virtual {v0, v2, v15}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;I)I

    move-result v27

    const-string v2, "viewability_check_initial_delay"

    const/4 v15, 0x0

    move-object/from16 v0, p0

    invoke-virtual {v0, v2, v15}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;I)I

    move-result v31

    const-string v2, "viewability_check_interval"

    const/16 v15, 0x3e8

    move-object/from16 v0, p0

    invoke-virtual {v0, v2, v15}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;I)I

    move-result v32

    const/16 v19, 0x0

    const-string v2, "ad_choices_icon"

    move-object/from16 v0, p0

    invoke-virtual {v0, v2}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v2

    const-string v15, "native_ui_config"

    move-object/from16 v0, p0

    invoke-virtual {v0, v15}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v15

    if-nez v15, :cond_145

    const/16 v33, 0x0

    :goto_cf
    if-eqz v2, :cond_d5

    invoke-static {v2}, Lcom/facebook/ads/NativeAd$Image;->fromJSONObject(Lorg/json/JSONObject;)Lcom/facebook/ads/NativeAd$Image;

    move-result-object v19

    :cond_d5
    const-string v2, "ad_choices_link_url"

    move-object/from16 v0, p0

    invoke-virtual {v0, v2}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v20

    const-string v2, "request_id"

    move-object/from16 v0, p0

    invoke-virtual {v0, v2}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v21

    const-string v2, "invalidation_behavior"

    move-object/from16 v0, p0

    invoke-virtual {v0, v2}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lcom/facebook/ads/internal/util/e;->a(Ljava/lang/String;)Lcom/facebook/ads/internal/util/e;

    move-result-object v15

    const-string v2, "invalidation_report_url"

    move-object/from16 v0, p0

    invoke-virtual {v0, v2}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v16

    const/16 v17, 0x0

    :try_start_fb
    new-instance v2, Lorg/json/JSONArray;

    const-string v22, "detection_strings"

    move-object/from16 v0, p0

    move-object/from16 v1, v22

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v22

    move-object/from16 v0, v22

    invoke-direct {v2, v0}, Lorg/json/JSONArray;-><init>(Ljava/lang/String;)V
    :try_end_10c
    .catch Lorg/json/JSONException; {:try_start_fb .. :try_end_10c} :catch_14d

    :goto_10c
    invoke-static {v2}, Lcom/facebook/ads/internal/util/f;->a(Lorg/json/JSONArray;)Ljava/util/Collection;

    move-result-object v17

    const-string v2, "trackers"

    move-object/from16 v0, p0

    invoke-virtual {v0, v2}, Lorg/json/JSONObject;->optJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v2

    new-instance v22, Lcom/facebook/ads/internal/adapters/n$a;

    move-object/from16 v0, v22

    invoke-direct {v0, v2}, Lcom/facebook/ads/internal/adapters/n$a;-><init>(Lorg/json/JSONArray;)V

    const-string v2, "video_url"

    move-object/from16 v0, p0

    invoke-virtual {v0, v2}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v28

    const-string v2, "video_play_report_url"

    move-object/from16 v0, p0

    invoke-virtual {v0, v2}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v29

    const-string v2, "video_time_report_url"

    move-object/from16 v0, p0

    invoke-virtual {v0, v2}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v30

    new-instance v2, Lcom/facebook/ads/internal/adapters/n;

    invoke-direct/range {v2 .. v33}, Lcom/facebook/ads/internal/adapters/n;-><init>(Landroid/net/Uri;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/facebook/ads/NativeAd$Image;Lcom/facebook/ads/NativeAd$Image;Lcom/facebook/ads/NativeAd$Rating;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/facebook/ads/internal/util/e;Ljava/lang/String;Ljava/util/Collection;ZLcom/facebook/ads/NativeAd$Image;Ljava/lang/String;Ljava/lang/String;Lcom/facebook/ads/internal/adapters/n$a;Ljava/lang/String;ZZIILjava/lang/String;Ljava/lang/String;Ljava/lang/String;IILcom/facebook/ads/NativeAdViewAttributes;)V

    invoke-direct {v2}, Lcom/facebook/ads/internal/adapters/n;->B()Z

    move-result v3

    if-nez v3, :cond_3

    const/4 v2, 0x0

    goto/16 :goto_3

    :cond_145
    new-instance v33, Lcom/facebook/ads/NativeAdViewAttributes;

    move-object/from16 v0, v33

    invoke-direct {v0, v15}, Lcom/facebook/ads/NativeAdViewAttributes;-><init>(Lorg/json/JSONObject;)V

    goto :goto_cf

    :catch_14d
    move-exception v2

    invoke-virtual {v2}, Lorg/json/JSONException;->printStackTrace()V

    move-object/from16 v2, v17

    goto :goto_10c
.end method

.method static synthetic a(Lcom/facebook/ads/internal/adapters/n;)Ljava/lang/String;
    .registers 2

    iget-object v0, p0, Lcom/facebook/ads/internal/adapters/n;->l:Ljava/lang/String;

    return-object v0
.end method

.method private a(Ljava/lang/String;Ljava/util/Map;Ljava/util/Map;)V
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;)V"
        }
    .end annotation

    invoke-interface {p3, p1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_11

    invoke-interface {p3, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    invoke-static {v0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-interface {p2, p1, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_11
    return-void
.end method

.method private a(Ljava/util/Map;Ljava/util/Map;)V
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;)V"
        }
    .end annotation

    const-string v0, "mil"

    invoke-interface {p2, v0}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1c

    const-string v0, "mil"

    invoke-interface {p2, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    const-string v1, "mil"

    invoke-interface {p2, v1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    if-nez v0, :cond_1c

    :goto_1b
    return-void

    :cond_1c
    const-string v0, "mil"

    const/4 v1, 0x1

    invoke-static {v1}, Ljava/lang/String;->valueOf(Z)Ljava/lang/String;

    move-result-object v1

    invoke-interface {p1, v0, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_1b
.end method

.method private b(Ljava/util/Map;)Ljava/util/Map;
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;)",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    const-string v1, "view"

    invoke-interface {p1, v1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1c

    const-string v1, "view"

    const-string v2, "view"

    invoke-interface {p1, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    invoke-static {v2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_1c
    const-string v1, "snapshot"

    invoke-interface {p1, v1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_33

    const-string v1, "snapshot"

    const-string v2, "snapshot"

    invoke-interface {p1, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    invoke-static {v2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_33
    return-object v0
.end method

.method private b(Ljava/util/Map;Ljava/util/Map;)V
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;)V"
        }
    .end annotation

    const-string v0, "nti"

    invoke-direct {p0, v0, p1, p2}, Lcom/facebook/ads/internal/adapters/n;->a(Ljava/lang/String;Ljava/util/Map;Ljava/util/Map;)V

    const-string v0, "nhs"

    invoke-direct {p0, v0, p1, p2}, Lcom/facebook/ads/internal/adapters/n;->a(Ljava/lang/String;Ljava/util/Map;Ljava/util/Map;)V

    const-string v0, "nmv"

    invoke-direct {p0, v0, p1, p2}, Lcom/facebook/ads/internal/adapters/n;->a(Ljava/lang/String;Ljava/util/Map;Ljava/util/Map;)V

    return-void
.end method


# virtual methods
.method public a()Lcom/facebook/ads/internal/util/e;
    .registers 2

    iget-object v0, p0, Lcom/facebook/ads/internal/adapters/n;->o:Lcom/facebook/ads/internal/util/e;

    return-object v0
.end method

.method public a(Landroid/content/Context;Ljava/util/Map;)V
    .registers 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;)V"
        }
    .end annotation

    const/4 v4, 0x1

    iget-boolean v0, p0, Lcom/facebook/ads/internal/adapters/n;->I:Z

    if-nez v0, :cond_38

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    if-eqz p2, :cond_1b

    invoke-direct {p0, v0, p2}, Lcom/facebook/ads/internal/adapters/n;->a(Ljava/util/Map;Ljava/util/Map;)V

    invoke-direct {p0, v0, p2}, Lcom/facebook/ads/internal/adapters/n;->b(Ljava/util/Map;Ljava/util/Map;)V

    const-string v1, "touch"

    invoke-static {p2}, Lcom/facebook/ads/internal/util/g;->a(Ljava/util/Map;)Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_1b
    new-instance v1, Lcom/facebook/ads/internal/util/o;

    invoke-direct {v1, v0}, Lcom/facebook/ads/internal/util/o;-><init>(Ljava/util/Map;)V

    new-array v0, v4, [Ljava/lang/String;

    const/4 v2, 0x0

    iget-object v3, p0, Lcom/facebook/ads/internal/adapters/n;->m:Ljava/lang/String;

    aput-object v3, v0, v2

    invoke-virtual {v1, v0}, Lcom/facebook/ads/internal/util/o;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    iget-object v0, p0, Lcom/facebook/ads/internal/adapters/n;->E:Lcom/facebook/ads/internal/adapters/n$a;

    const-string v1, "click"

    invoke-virtual {v0, v1}, Lcom/facebook/ads/internal/adapters/n$a;->a(Ljava/lang/String;)V

    iput-boolean v4, p0, Lcom/facebook/ads/internal/adapters/n;->I:Z

    const-string v0, "Click logged"

    invoke-static {p1, v0}, Lcom/facebook/ads/internal/util/g;->a(Landroid/content/Context;Ljava/lang/String;)V

    :cond_38
    iget-object v0, p0, Lcom/facebook/ads/internal/adapters/n;->b:Landroid/net/Uri;

    invoke-static {p1, v0}, Lcom/facebook/ads/internal/action/b;->a(Landroid/content/Context;Landroid/net/Uri;)Lcom/facebook/ads/internal/action/a;

    move-result-object v0

    if-eqz v0, :cond_4f

    :try_start_40
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    iput-wide v2, p0, Lcom/facebook/ads/internal/adapters/n;->K:J

    invoke-virtual {v0}, Lcom/facebook/ads/internal/action/a;->a()Lcom/facebook/ads/internal/util/b$a;

    move-result-object v1

    iput-object v1, p0, Lcom/facebook/ads/internal/adapters/n;->L:Lcom/facebook/ads/internal/util/b$a;

    invoke-virtual {v0}, Lcom/facebook/ads/internal/action/a;->b()V
    :try_end_4f
    .catch Ljava/lang/Exception; {:try_start_40 .. :try_end_4f} :catch_50

    :cond_4f
    :goto_4f
    return-void

    :catch_50
    move-exception v0

    sget-object v1, Lcom/facebook/ads/internal/adapters/n;->a:Ljava/lang/String;

    const-string v2, "Error executing action"

    invoke-static {v1, v2, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_4f
.end method

.method public a(Ljava/util/Map;)V
    .registers 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;)V"
        }
    .end annotation

    const/4 v5, 0x1

    iget-boolean v0, p0, Lcom/facebook/ads/internal/adapters/n;->H:Z

    if-nez v0, :cond_4c

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    if-eqz p1, :cond_12

    invoke-direct {p0, v0, p1}, Lcom/facebook/ads/internal/adapters/n;->a(Ljava/util/Map;Ljava/util/Map;)V

    invoke-direct {p0, v0, p1}, Lcom/facebook/ads/internal/adapters/n;->b(Ljava/util/Map;Ljava/util/Map;)V

    :cond_12
    new-instance v1, Lcom/facebook/ads/internal/util/o;

    invoke-direct {v1, v0}, Lcom/facebook/ads/internal/util/o;-><init>(Ljava/util/Map;)V

    new-array v2, v5, [Ljava/lang/String;

    const/4 v3, 0x0

    iget-object v4, p0, Lcom/facebook/ads/internal/adapters/n;->k:Ljava/lang/String;

    aput-object v4, v2, v3

    invoke-virtual {v1, v2}, Lcom/facebook/ads/internal/util/o;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    invoke-virtual {p0}, Lcom/facebook/ads/internal/adapters/n;->p()Z

    move-result v1

    if-nez v1, :cond_2d

    invoke-virtual {p0}, Lcom/facebook/ads/internal/adapters/n;->q()Z

    move-result v1

    if-eqz v1, :cond_43

    :cond_2d
    :try_start_2d
    invoke-direct {p0, p1}, Lcom/facebook/ads/internal/adapters/n;->b(Ljava/util/Map;)Ljava/util/Map;

    move-result-object v1

    new-instance v2, Landroid/os/Handler;

    invoke-direct {v2}, Landroid/os/Handler;-><init>()V

    new-instance v3, Lcom/facebook/ads/internal/adapters/n$1;

    invoke-direct {v3, p0, v0, v1}, Lcom/facebook/ads/internal/adapters/n$1;-><init>(Lcom/facebook/ads/internal/adapters/n;Ljava/util/Map;Ljava/util/Map;)V

    iget v0, p0, Lcom/facebook/ads/internal/adapters/n;->u:I

    mul-int/lit16 v0, v0, 0x3e8

    int-to-long v0, v0

    invoke-virtual {v2, v3, v0, v1}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z
    :try_end_43
    .catch Ljava/lang/Exception; {:try_start_2d .. :try_end_43} :catch_4d

    :cond_43
    :goto_43
    iget-object v0, p0, Lcom/facebook/ads/internal/adapters/n;->E:Lcom/facebook/ads/internal/adapters/n$a;

    const-string v1, "impression"

    invoke-virtual {v0, v1}, Lcom/facebook/ads/internal/adapters/n$a;->a(Ljava/lang/String;)V

    iput-boolean v5, p0, Lcom/facebook/ads/internal/adapters/n;->H:Z

    :cond_4c
    return-void

    :catch_4d
    move-exception v0

    goto :goto_43
.end method

.method public b()Ljava/lang/String;
    .registers 2

    iget-object v0, p0, Lcom/facebook/ads/internal/adapters/n;->p:Ljava/lang/String;

    return-object v0
.end method

.method public c()Ljava/util/Collection;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Collection",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    iget-object v0, p0, Lcom/facebook/ads/internal/adapters/n;->q:Ljava/util/Collection;

    return-object v0
.end method

.method public e()Lcom/facebook/ads/NativeAd$Image;
    .registers 2

    iget-object v0, p0, Lcom/facebook/ads/internal/adapters/n;->i:Lcom/facebook/ads/NativeAd$Image;

    return-object v0
.end method

.method public l()Ljava/lang/String;
    .registers 2

    iget-object v0, p0, Lcom/facebook/ads/internal/adapters/n;->y:Ljava/lang/String;

    return-object v0
.end method

.method public m()Ljava/lang/String;
    .registers 2

    iget-object v0, p0, Lcom/facebook/ads/internal/adapters/n;->z:Ljava/lang/String;

    return-object v0
.end method

.method public n()Ljava/lang/String;
    .registers 2

    iget-object v0, p0, Lcom/facebook/ads/internal/adapters/n;->A:Ljava/lang/String;

    return-object v0
.end method

.method public p()Z
    .registers 2

    iget-boolean v0, p0, Lcom/facebook/ads/internal/adapters/n;->s:Z

    return v0
.end method

.method public q()Z
    .registers 2

    iget-boolean v0, p0, Lcom/facebook/ads/internal/adapters/n;->t:Z

    return v0
.end method

.method public r()I
    .registers 3

    iget v0, p0, Lcom/facebook/ads/internal/adapters/n;->v:I

    if-ltz v0, :cond_a

    iget v0, p0, Lcom/facebook/ads/internal/adapters/n;->v:I

    const/16 v1, 0x64

    if-le v0, v1, :cond_c

    :cond_a
    const/4 v0, 0x0

    :goto_b
    return v0

    :cond_c
    iget v0, p0, Lcom/facebook/ads/internal/adapters/n;->v:I

    goto :goto_b
.end method

.method public v()Ljava/lang/String;
    .registers 2

    iget-object v0, p0, Lcom/facebook/ads/internal/adapters/n;->D:Ljava/lang/String;

    return-object v0
.end method
