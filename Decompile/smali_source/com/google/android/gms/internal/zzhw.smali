.class public Lcom/google/android/gms/internal/zzhw;
.super Ljava/lang/Object;


# annotations
.annotation runtime Lcom/google/android/gms/internal/zzgk;
.end annotation


# instance fields
.field private final mContext:Landroid/content/Context;

.field private mState:I

.field private zzHO:Ljava/lang/String;

.field private zzHP:F

.field private zzHQ:F

.field private zzHR:F

.field private final zzzP:F


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .registers 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    iput v0, p0, Lcom/google/android/gms/internal/zzhw;->mState:I

    iput-object p1, p0, Lcom/google/android/gms/internal/zzhw;->mContext:Landroid/content/Context;

    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v0

    iget v0, v0, Landroid/util/DisplayMetrics;->density:F

    iput v0, p0, Lcom/google/android/gms/internal/zzhw;->zzzP:F

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Ljava/lang/String;)V
    .registers 3

    invoke-direct {p0, p1}, Lcom/google/android/gms/internal/zzhw;-><init>(Landroid/content/Context;)V

    iput-object p2, p0, Lcom/google/android/gms/internal/zzhw;->zzHO:Ljava/lang/String;

    return-void
.end method

.method private showDialog()V
    .registers 5

    iget-object v0, p0, Lcom/google/android/gms/internal/zzhw;->mContext:Landroid/content/Context;

    instance-of v0, v0, Landroid/app/Activity;

    if-nez v0, :cond_c

    const-string v0, "Can not create dialog without Activity Context"

    invoke-static {v0}, Lcom/google/android/gms/ads/internal/util/client/zzb;->zzaD(Ljava/lang/String;)V

    :goto_b
    return-void

    :cond_c
    iget-object v0, p0, Lcom/google/android/gms/internal/zzhw;->zzHO:Ljava/lang/String;

    invoke-static {v0}, Lcom/google/android/gms/internal/zzhw;->zzaA(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    new-instance v1, Landroid/app/AlertDialog$Builder;

    iget-object v2, p0, Lcom/google/android/gms/internal/zzhw;->mContext:Landroid/content/Context;

    invoke-direct {v1, v2}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    invoke-virtual {v1, v0}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    const-string v2, "Ad Information"

    invoke-virtual {v1, v2}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    const-string v2, "Share"

    new-instance v3, Lcom/google/android/gms/internal/zzhw$1;

    invoke-direct {v3, p0, v0}, Lcom/google/android/gms/internal/zzhw$1;-><init>(Lcom/google/android/gms/internal/zzhw;Ljava/lang/String;)V

    invoke-virtual {v1, v2, v3}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    const-string v0, "Close"

    new-instance v2, Lcom/google/android/gms/internal/zzhw$2;

    invoke-direct {v2, p0}, Lcom/google/android/gms/internal/zzhw$2;-><init>(Lcom/google/android/gms/internal/zzhw;)V

    invoke-virtual {v1, v0, v2}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    invoke-virtual {v1}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/AlertDialog;->show()V

    goto :goto_b
.end method

.method static synthetic zza(Lcom/google/android/gms/internal/zzhw;)Landroid/content/Context;
    .registers 2

    iget-object v0, p0, Lcom/google/android/gms/internal/zzhw;->mContext:Landroid/content/Context;

    return-object v0
.end method

.method static zzaA(Ljava/lang/String;)Ljava/lang/String;
    .registers 7

    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_9

    const-string v0, "No debug information"

    :cond_8
    :goto_8
    return-object v0

    :cond_9
    const-string v0, "\\+"

    const-string v1, "%20"

    invoke-virtual {p0, v0, v1}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    new-instance v1, Landroid/net/Uri$Builder;

    invoke-direct {v1}, Landroid/net/Uri$Builder;-><init>()V

    invoke-virtual {v1, v0}, Landroid/net/Uri$Builder;->encodedQuery(Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object v0

    invoke-virtual {v0}, Landroid/net/Uri$Builder;->build()Landroid/net/Uri;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-static {}, Lcom/google/android/gms/ads/internal/zzp;->zzbx()Lcom/google/android/gms/internal/zzhu;

    move-result-object v2

    invoke-virtual {v2, v0}, Lcom/google/android/gms/internal/zzhu;->zze(Landroid/net/Uri;)Ljava/util/Map;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_33
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_59

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, " = "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-interface {v2, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v4, "\n\n"

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_33

    :cond_59
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_8

    const-string v0, "No debug information"

    goto :goto_8
.end method


# virtual methods
.method zza(IFF)V
    .registers 11

    const/4 v6, 0x3

    const/4 v5, -0x1

    const/4 v4, 0x2

    const/4 v3, 0x1

    if-nez p1, :cond_10

    const/4 v0, 0x0

    iput v0, p0, Lcom/google/android/gms/internal/zzhw;->mState:I

    iput p2, p0, Lcom/google/android/gms/internal/zzhw;->zzHP:F

    iput p3, p0, Lcom/google/android/gms/internal/zzhw;->zzHQ:F

    iput p3, p0, Lcom/google/android/gms/internal/zzhw;->zzHR:F

    :cond_f
    :goto_f
    return-void

    :cond_10
    iget v0, p0, Lcom/google/android/gms/internal/zzhw;->mState:I

    if-eq v0, v5, :cond_f

    if-ne p1, v4, :cond_92

    iget v0, p0, Lcom/google/android/gms/internal/zzhw;->zzHQ:F

    cmpl-float v0, p3, v0

    if-lez v0, :cond_2f

    iput p3, p0, Lcom/google/android/gms/internal/zzhw;->zzHQ:F

    :cond_1e
    :goto_1e
    iget v0, p0, Lcom/google/android/gms/internal/zzhw;->zzHQ:F

    iget v1, p0, Lcom/google/android/gms/internal/zzhw;->zzHR:F

    sub-float/2addr v0, v1

    const/high16 v1, 0x41f00000

    iget v2, p0, Lcom/google/android/gms/internal/zzhw;->zzzP:F

    mul-float/2addr v1, v2

    cmpl-float v0, v0, v1

    if-lez v0, :cond_38

    iput v5, p0, Lcom/google/android/gms/internal/zzhw;->mState:I

    goto :goto_f

    :cond_2f
    iget v0, p0, Lcom/google/android/gms/internal/zzhw;->zzHR:F

    cmpg-float v0, p3, v0

    if-gez v0, :cond_1e

    iput p3, p0, Lcom/google/android/gms/internal/zzhw;->zzHR:F

    goto :goto_1e

    :cond_38
    iget v0, p0, Lcom/google/android/gms/internal/zzhw;->mState:I

    if-eqz v0, :cond_40

    iget v0, p0, Lcom/google/android/gms/internal/zzhw;->mState:I

    if-ne v0, v4, :cond_66

    :cond_40
    iget v0, p0, Lcom/google/android/gms/internal/zzhw;->zzHP:F

    sub-float v0, p2, v0

    const/high16 v1, 0x42480000

    iget v2, p0, Lcom/google/android/gms/internal/zzhw;->zzzP:F

    mul-float/2addr v1, v2

    cmpl-float v0, v0, v1

    if-ltz v0, :cond_55

    iput p2, p0, Lcom/google/android/gms/internal/zzhw;->zzHP:F

    iget v0, p0, Lcom/google/android/gms/internal/zzhw;->mState:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/google/android/gms/internal/zzhw;->mState:I

    :cond_55
    :goto_55
    iget v0, p0, Lcom/google/android/gms/internal/zzhw;->mState:I

    if-eq v0, v3, :cond_5d

    iget v0, p0, Lcom/google/android/gms/internal/zzhw;->mState:I

    if-ne v0, v6, :cond_84

    :cond_5d
    iget v0, p0, Lcom/google/android/gms/internal/zzhw;->zzHP:F

    cmpl-float v0, p2, v0

    if-lez v0, :cond_f

    iput p2, p0, Lcom/google/android/gms/internal/zzhw;->zzHP:F

    goto :goto_f

    :cond_66
    iget v0, p0, Lcom/google/android/gms/internal/zzhw;->mState:I

    if-eq v0, v3, :cond_6e

    iget v0, p0, Lcom/google/android/gms/internal/zzhw;->mState:I

    if-ne v0, v6, :cond_55

    :cond_6e
    iget v0, p0, Lcom/google/android/gms/internal/zzhw;->zzHP:F

    sub-float v0, p2, v0

    const/high16 v1, -0x3db80000

    iget v2, p0, Lcom/google/android/gms/internal/zzhw;->zzzP:F

    mul-float/2addr v1, v2

    cmpg-float v0, v0, v1

    if-gtz v0, :cond_55

    iput p2, p0, Lcom/google/android/gms/internal/zzhw;->zzHP:F

    iget v0, p0, Lcom/google/android/gms/internal/zzhw;->mState:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/google/android/gms/internal/zzhw;->mState:I

    goto :goto_55

    :cond_84
    iget v0, p0, Lcom/google/android/gms/internal/zzhw;->mState:I

    if-ne v0, v4, :cond_f

    iget v0, p0, Lcom/google/android/gms/internal/zzhw;->zzHP:F

    cmpg-float v0, p2, v0

    if-gez v0, :cond_f

    iput p2, p0, Lcom/google/android/gms/internal/zzhw;->zzHP:F

    goto/16 :goto_f

    :cond_92
    if-ne p1, v3, :cond_f

    iget v0, p0, Lcom/google/android/gms/internal/zzhw;->mState:I

    const/4 v1, 0x4

    if-ne v0, v1, :cond_f

    invoke-direct {p0}, Lcom/google/android/gms/internal/zzhw;->showDialog()V

    goto/16 :goto_f
.end method

.method public zzaz(Ljava/lang/String;)V
    .registers 2

    iput-object p1, p0, Lcom/google/android/gms/internal/zzhw;->zzHO:Ljava/lang/String;

    return-void
.end method

.method public zze(Landroid/view/MotionEvent;)V
    .registers 8

    const/4 v1, 0x0

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getHistorySize()I

    move-result v2

    move v0, v1

    :goto_6
    if-ge v0, v2, :cond_1a

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getActionMasked()I

    move-result v3

    invoke-virtual {p1, v1, v0}, Landroid/view/MotionEvent;->getHistoricalX(II)F

    move-result v4

    invoke-virtual {p1, v1, v0}, Landroid/view/MotionEvent;->getHistoricalY(II)F

    move-result v5

    invoke-virtual {p0, v3, v4, v5}, Lcom/google/android/gms/internal/zzhw;->zza(IFF)V

    add-int/lit8 v0, v0, 0x1

    goto :goto_6

    :cond_1a
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getActionMasked()I

    move-result v0

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v1

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result v2

    invoke-virtual {p0, v0, v1, v2}, Lcom/google/android/gms/internal/zzhw;->zza(IFF)V

    return-void
.end method
