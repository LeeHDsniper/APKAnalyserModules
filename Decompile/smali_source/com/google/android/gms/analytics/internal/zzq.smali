.class abstract Lcom/google/android/gms/analytics/internal/zzq;
.super Lcom/google/android/gms/analytics/internal/zzc;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/android/gms/analytics/internal/zzq$zza;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T::",
        "Lcom/google/android/gms/analytics/internal/zzp;",
        ">",
        "Lcom/google/android/gms/analytics/internal/zzc;"
    }
.end annotation


# instance fields
.field zzMM:Lcom/google/android/gms/analytics/internal/zzq$zza;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/android/gms/analytics/internal/zzq$zza",
            "<TT;>;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lcom/google/android/gms/analytics/internal/zzf;Lcom/google/android/gms/analytics/internal/zzq$zza;)V
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/android/gms/analytics/internal/zzf;",
            "Lcom/google/android/gms/analytics/internal/zzq$zza",
            "<TT;>;)V"
        }
    .end annotation

    invoke-direct {p0, p1}, Lcom/google/android/gms/analytics/internal/zzc;-><init>(Lcom/google/android/gms/analytics/internal/zzf;)V

    iput-object p2, p0, Lcom/google/android/gms/analytics/internal/zzq;->zzMM:Lcom/google/android/gms/analytics/internal/zzq$zza;

    return-void
.end method

.method private zza(Landroid/content/res/XmlResourceParser;)Lcom/google/android/gms/analytics/internal/zzp;
    .registers 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/res/XmlResourceParser;",
            ")TT;"
        }
    .end annotation

    :try_start_0
    invoke-interface {p1}, Landroid/content/res/XmlResourceParser;->next()I

    invoke-interface {p1}, Landroid/content/res/XmlResourceParser;->getEventType()I

    move-result v0

    :goto_7
    const/4 v1, 0x1

    if-eq v0, v1, :cond_71

    invoke-interface {p1}, Landroid/content/res/XmlResourceParser;->getEventType()I

    move-result v0

    const/4 v1, 0x2

    if-ne v0, v1, :cond_41

    invoke-interface {p1}, Landroid/content/res/XmlResourceParser;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v0

    const-string v1, "screenname"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_46

    const/4 v0, 0x0

    const-string v1, "name"

    invoke-interface {p1, v0, v1}, Landroid/content/res/XmlResourceParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-interface {p1}, Landroid/content/res/XmlResourceParser;->nextText()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_41

    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_41

    iget-object v2, p0, Lcom/google/android/gms/analytics/internal/zzq;->zzMM:Lcom/google/android/gms/analytics/internal/zzq$zza;

    invoke-interface {v2, v0, v1}, Lcom/google/android/gms/analytics/internal/zzq$zza;->zzl(Ljava/lang/String;Ljava/lang/String;)V

    :cond_41
    :goto_41
    invoke-interface {p1}, Landroid/content/res/XmlResourceParser;->next()I

    move-result v0

    goto :goto_7

    :cond_46
    const-string v1, "string"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_78

    const/4 v0, 0x0

    const-string v1, "name"

    invoke-interface {p1, v0, v1}, Landroid/content/res/XmlResourceParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-interface {p1}, Landroid/content/res/XmlResourceParser;->nextText()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_41

    if-eqz v1, :cond_41

    iget-object v2, p0, Lcom/google/android/gms/analytics/internal/zzq;->zzMM:Lcom/google/android/gms/analytics/internal/zzq$zza;

    invoke-interface {v2, v0, v1}, Lcom/google/android/gms/analytics/internal/zzq$zza;->zzm(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_6a
    .catch Lorg/xmlpull/v1/XmlPullParserException; {:try_start_0 .. :try_end_6a} :catch_6b
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_6a} :catch_ac

    goto :goto_41

    :catch_6b
    move-exception v0

    const-string v1, "Error parsing tracker configuration file"

    invoke-virtual {p0, v1, v0}, Lcom/google/android/gms/analytics/internal/zzq;->zze(Ljava/lang/String;Ljava/lang/Object;)V

    :cond_71
    :goto_71
    iget-object v0, p0, Lcom/google/android/gms/analytics/internal/zzq;->zzMM:Lcom/google/android/gms/analytics/internal/zzq$zza;

    invoke-interface {v0}, Lcom/google/android/gms/analytics/internal/zzq$zza;->zzjj()Lcom/google/android/gms/analytics/internal/zzp;

    move-result-object v0

    return-object v0

    :cond_78
    :try_start_78
    const-string v1, "bool"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_b3

    const/4 v0, 0x0

    const-string v1, "name"

    invoke-interface {p1, v0, v1}, Landroid/content/res/XmlResourceParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-interface {p1}, Landroid/content/res/XmlResourceParser;->nextText()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_41

    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z
    :try_end_98
    .catch Lorg/xmlpull/v1/XmlPullParserException; {:try_start_78 .. :try_end_98} :catch_6b
    .catch Ljava/io/IOException; {:try_start_78 .. :try_end_98} :catch_ac

    move-result v2

    if-nez v2, :cond_41

    :try_start_9b
    invoke-static {v1}, Ljava/lang/Boolean;->parseBoolean(Ljava/lang/String;)Z

    move-result v2

    iget-object v3, p0, Lcom/google/android/gms/analytics/internal/zzq;->zzMM:Lcom/google/android/gms/analytics/internal/zzq$zza;

    invoke-interface {v3, v0, v2}, Lcom/google/android/gms/analytics/internal/zzq$zza;->zzc(Ljava/lang/String;Z)V
    :try_end_a4
    .catch Ljava/lang/NumberFormatException; {:try_start_9b .. :try_end_a4} :catch_a5
    .catch Lorg/xmlpull/v1/XmlPullParserException; {:try_start_9b .. :try_end_a4} :catch_6b
    .catch Ljava/io/IOException; {:try_start_9b .. :try_end_a4} :catch_ac

    goto :goto_41

    :catch_a5
    move-exception v0

    :try_start_a6
    const-string v2, "Error parsing bool configuration value"

    invoke-virtual {p0, v2, v1, v0}, Lcom/google/android/gms/analytics/internal/zzq;->zzc(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V
    :try_end_ab
    .catch Lorg/xmlpull/v1/XmlPullParserException; {:try_start_a6 .. :try_end_ab} :catch_6b
    .catch Ljava/io/IOException; {:try_start_a6 .. :try_end_ab} :catch_ac

    goto :goto_41

    :catch_ac
    move-exception v0

    const-string v1, "Error parsing tracker configuration file"

    invoke-virtual {p0, v1, v0}, Lcom/google/android/gms/analytics/internal/zzq;->zze(Ljava/lang/String;Ljava/lang/Object;)V

    goto :goto_71

    :cond_b3
    :try_start_b3
    const-string v1, "integer"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_41

    const/4 v0, 0x0

    const-string v1, "name"

    invoke-interface {p1, v0, v1}, Landroid/content/res/XmlResourceParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-interface {p1}, Landroid/content/res/XmlResourceParser;->nextText()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_41

    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z
    :try_end_d3
    .catch Lorg/xmlpull/v1/XmlPullParserException; {:try_start_b3 .. :try_end_d3} :catch_6b
    .catch Ljava/io/IOException; {:try_start_b3 .. :try_end_d3} :catch_ac

    move-result v2

    if-nez v2, :cond_41

    :try_start_d6
    invoke-static {v1}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v2

    iget-object v3, p0, Lcom/google/android/gms/analytics/internal/zzq;->zzMM:Lcom/google/android/gms/analytics/internal/zzq$zza;

    invoke-interface {v3, v0, v2}, Lcom/google/android/gms/analytics/internal/zzq$zza;->zzd(Ljava/lang/String;I)V
    :try_end_df
    .catch Ljava/lang/NumberFormatException; {:try_start_d6 .. :try_end_df} :catch_e1
    .catch Lorg/xmlpull/v1/XmlPullParserException; {:try_start_d6 .. :try_end_df} :catch_6b
    .catch Ljava/io/IOException; {:try_start_d6 .. :try_end_df} :catch_ac

    goto/16 :goto_41

    :catch_e1
    move-exception v0

    :try_start_e2
    const-string v2, "Error parsing int configuration value"

    invoke-virtual {p0, v2, v1, v0}, Lcom/google/android/gms/analytics/internal/zzq;->zzc(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V
    :try_end_e7
    .catch Lorg/xmlpull/v1/XmlPullParserException; {:try_start_e2 .. :try_end_e7} :catch_6b
    .catch Ljava/io/IOException; {:try_start_e2 .. :try_end_e7} :catch_ac

    goto/16 :goto_41
.end method


# virtual methods
.method public zzac(I)Lcom/google/android/gms/analytics/internal/zzp;
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)TT;"
        }
    .end annotation

    :try_start_0
    invoke-virtual {p0}, Lcom/google/android/gms/analytics/internal/zzq;->zzia()Lcom/google/android/gms/analytics/internal/zzf;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gms/analytics/internal/zzf;->zziq()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/content/res/Resources;->getXml(I)Landroid/content/res/XmlResourceParser;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/google/android/gms/analytics/internal/zzq;->zza(Landroid/content/res/XmlResourceParser;)Lcom/google/android/gms/analytics/internal/zzp;
    :try_end_13
    .catch Landroid/content/res/Resources$NotFoundException; {:try_start_0 .. :try_end_13} :catch_15

    move-result-object v0

    :goto_14
    return-object v0

    :catch_15
    move-exception v0

    const-string v1, "inflate() called with unknown resourceId"

    invoke-virtual {p0, v1, v0}, Lcom/google/android/gms/analytics/internal/zzq;->zzd(Ljava/lang/String;Ljava/lang/Object;)V

    const/4 v0, 0x0

    goto :goto_14
.end method
