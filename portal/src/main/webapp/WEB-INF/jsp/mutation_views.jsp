<script type="text/template" id="default_mutation_details_template">
	<div id='mutation_3d_container' class='mutation-3d-container'></div>
	<div id='mutation_details_loader'>
		<img src='{{loaderImage}}'/>
	</div>
	<div id='mutation_details_content' class='mutation-details-content'>
		<ul>
			{{listContent}}
		</ul>
		{{mainContent}}
	</div>
</script>

<script type="text/template" id="default_mutation_details_info_template">
	<p>There are no mutation details available for the gene set entered.</p>
	<br>
	<br>
</script>

<script type="text/template" id="default_mutation_details_main_content_template">
	<div id='mutation_details_{{geneSymbol}}'>
		<img src='{{loaderImage}}'/>
	</div>
</script>

<script type="text/template" id="default_mutation_details_list_content_template">
	<li>
		<a href="#mutation_details_{{geneSymbol}}"
		   id="mutation_details_tab_{{geneSymbol}}"
		   class="mutation-details-tabs-ref"
		   title="{{geneSymbol}} mutations">
			<span>{{geneSymbol}}</span>
		</a>
	</li>
</script>

<script type="text/template" id="mutation_view_template">
	<h4>{{geneSymbol}}: {{mutationSummary}}</h4>
	<div id='mutation_diagram_toolbar_{{geneSymbol}}' class='mutation-diagram-toolbar'>
		<a href='http://www.uniprot.org/uniprot/{{uniprotId}}'
		   class='mutation-details-uniprot-link'
		   target='_blank'>{{uniprotId}}</a>
		<form style="display:inline-block"
		      action='svgtopdf.do'
		      method='post'
		      class='svg-to-pdf-form'>
			<input type='hidden' name='svgelement'>
			<input type='hidden' name='filetype' value='pdf'>
			<input type='hidden' name='filename' value='mutation_diagram_{{geneSymbol}}.pdf'>
		</form>
		<form style="display:inline-block"
		      action='svgtopdf.do'
		      method='post'
		      class='svg-to-file-form'>
			<input type='hidden' name='svgelement'>
			<input type='hidden' name='filetype' value='svg'>
			<input type='hidden' name='filename' value='mutation_diagram_{{geneSymbol}}.svg'>
		</form>
		<button class='diagram-to-pdf'>PDF</button>
		<button class='diagram-to-svg'>SVG</button>
	</div>
	<div>
		<table>
			<tr>
				<td>
					<div id='mutation_diagram_{{geneSymbol}}' class='mutation-diagram-container'></div>
				</td>
				<td>
					<div id='mutation_3d_{{geneSymbol}}' class="mutation-3d-initializer"></div>
				</td>
			</tr>
		</table>
	</div>
	<div id='mutation_pdb_panel_view_{{geneSymbol}}' class="mutation-pdb-panel-view"></div>

	<div class='mutation-details-filter-info'>
		Current view shows filtered results.
		Click <a class='mutation-details-filter-reset'>here</a> to reset all filters.
	</div>
	<div id='mutation_table_{{geneSymbol}}' class='mutation-table-container'>
		<img src='images/ajax-loader.gif'/>
	</div>
</script>

<script type="text/template" id="mutation_3d_view_template">
	<button class='mutation-3d-vis'>
		<table>
			<tr>
				<td><img alt="J" src='images/jmol.png'/></td>
				<td><label>Visualize in Jmol</label></td>
			</tr>
		</table>
	</button>
</script>

<script type="text/template" id="mutation_3d_vis_template">
	<div class='mutation-3d-vis-header'>
		<a class='mutation-3d-close'>X</a>
		<label class='mutation-3d-info'>
			3D structure for the PDB id <span class='mutation-3d-pdb-id'></span>
			and the chain <span class='mutation-3d-chain-id'></span>
		</label>
	</div>
	<div id='mutation_3d_visualizer'></div>
	<div class='mutation-3d-vis-toolbar'>
		<table>
		    <tr>
			    <td>
					<label><b>Select style:</b></label>
			    </td>
			    <td>
					<select class='mutation-3d-style-select'>
						<option value='cartoon'
						        title='Switch to Cartoon View'>cartoon</option>
						<option value='ballAndStick'
						        title='Switch to Ball and Stick View'>ball & stick</option>
					</select>
				</td>
			    <td>
					<input class='mutation-3d-spin' type='checkbox'>
			    </td>
			    <td>
				    <label>Turn on Spin</label>
			    </td>
		    </tr>
		</table>
	</div>
</script>

<script type="text/template" id="pdb_panel_view_template">
	<table>
		<tr>
			<td valign="top">
				<div id='mutation_pdb_panel_{{geneSymbol}}' class='mutation-pdb-panel-container'></div>
			</td>
			<td></td>
		</tr>
		<tr>
			<td valign="top" align="center">
				<div id='mutation_pdb_controls_{{geneSymbol}}' class='mutation-pdb-panel-controls'>
					<button class='expand-collapse-pdb-panel'
					        title='Expand/Collapse PDB Chains'></button>
				</div>
			</td>
			<td></td>
		</tr>
	</table>
</script>

<script type="text/template" id="mutation_details_table_template">
	<table id='mutation_details_table_{{geneSymbol}}' class='display mutation_details_table'
	       cellpadding='0' cellspacing='0' border='0'>
		<thead>{{tableHeaders}}</thead>
		<tbody>{{tableRows}}</tbody>
		<tfoot>{{tableHeaders}}</tfoot>
	</table>
</script>

<script type="text/template" id="mutation_details_table_data_row_template">
	<tr id='{{mutationId}}'>
		<td>{{mutationId}}</td>
		<td>
			<a href='{{linkToPatientView}}' target='_blank'>
				<b>{{caseId}}</b>
			</a>
		</td>
		<td>
			<span class='{{proteinChangeClass}}' alt='{{proteinChangeTip}}'>
				{{proteinChange}}
			</span>
		</td>
		<td>
			<span class='{{mutationTypeClass}}'>
				<label>{{mutationTypeText}}</label>
			</span>
		</td>
		<td>
			<label class='{{cosmicClass}}' alt='{{mutationId}}'><b>{{cosmicCount}}</b></label>
		</td>
		<td>
			<span class='{{omaClass}} {{fisClass}}' alt='{{fisValue}}|{{xVarLink}}'>
				<label>{{fisText}}</label>
			</span>
		</td>
		<td>
			<a href='{{msaLink}}' target='_blank'>
				<span style="background-color:#88C;color:white">
					&nbsp;msa&nbsp;
				</span>
			</a>
		</td>
		<td>
			<a href='{{pdbLink}}' target='_blank'>
				<span style="background-color:#88C;color:white">
					&nbsp;3D&nbsp;
				</span>
			</a>
		</td>
		<td>
			<span alt='{{mutationStatusTip}}' class='simple-tip {{mutationStatusClass}}'>
				<label>{{mutationStatusText}}</label>
			</span>
		</td>
		<td>
			<span alt='{{validationStatusTip}}' class="simple-tip {{validationStatusClass}}">
				<label>{{validationStatusText}}</label>
			</span>
		</td>
		<td>{{sequencingCenter}}</td>
		<td>{{chr}}</td>
		<td>
			<label class='{{startPosClass}}'>{{startPos}}</label>
		</td>
		<td>
			<label class='{{endPosClass}}'>{{endPos}}</label>
		</td>
		<td>{{referenceAllele}}</td>
		<td>{{variantAllele}}</td>
		<td>
			<label alt='<b>{{tumorAltCount}}</b> variant reads out of <b>{{tumorTotalCount}}</b> total'
			       class='{{tumorFreqClass}} {{tumorFreqTipClass}}'>{{tumorFreq}}</label>
		</td>
		<td>
			<label alt='<b>{{normalAltCount}}</b> variant reads out of <b>{{normalTotalCount}}</b> total'
			       class='{{normalFreqClass}} {{normalFreqTipClass}}'>{{normalFreq}}</label>
		</td>
		<td>
			<label class='{{tumorRefCountClass}}'>{{tumorRefCount}}</label>
		</td>
		<td>
			<label class='{{tumorAltCountClass}}'>{{tumorAltCount}}</label>
		</td>
		<td>
			<label class='{{normalRefCountClass}}'>{{normalRefCount}}</label>
		</td>
		<td>
			<label class='{{normalAltCountClass}}'>{{normalAltCount}}</label>
		</td>
		<td>
			<a class='igv-link' alt='{{igvLink}}'>
				<span style="background-color:#88C;color:white">
					&nbsp;IGV&nbsp;
				</span>
			</a>
		</td>
		<td>
			<label class='{{mutationCountClass}}'>{{mutationCount}}</label>
		</td>
	</tr>
</script>

<script type="text/template" id="mutation_details_table_header_row_template">
	<th alt='Mutation ID' class='mutation-table-header'>Mutation ID</th>
	<th alt='Case ID' class='mutation-table-header'>Case ID</th>
	<th alt='Protein Change' class='mutation-table-header'>AA Change</th>
	<th alt='Mutation Type' class='mutation-table-header'>Type</th>
	<th alt='Overlapping mutations in COSMIC' class='mutation-table-header'>COSMIC</th>
	<th alt='Predicted Functional Impact Score (via Mutation Assessor) for missense mutations'
	    class='mutation-table-header'>FIS</th>
	<th alt='Conservation' class='mutation-table-header'>Cons</th>
	<th alt='3D Structure' class='mutation-table-header'>3D</th>
	<th alt='Mutation Status' class='mutation-table-header'>MS</th>
	<th alt='Validation Status' class='mutation-table-header'>VS</th>
	<th alt='Sequencing Center' class='mutation-table-header'>Center</th>
	<!--th alt='NCBI Build Number' class='mutation-table-header'>Build</th-->
	<th alt='Chromosome' class='mutation-table-header'>Chr</th>
	<th alt='Start Position' class='mutation-table-header'>Start Pos</th>
	<th alt='End Position' class='mutation-table-header'>End Pos</th>
	<th alt='Reference Allele' class='mutation-table-header'>Ref</th>
	<th alt='Variant Allele' class='mutation-table-header'>Var</th>
	<th alt='Variant allele frequency<br> in the tumor sample'
	    class='mutation-table-header'>Allele Freq (T)</th>
	<th alt='Variant allele frequency<br> in the normal sample'
	    class='mutation-table-header'>Allele Freq (N)</th>
	<th alt='Variant Ref Count' class='mutation-table-header'>Var Ref</th>
	<th alt='Variant Alt Count' class='mutation-table-header'>Var Alt</th>
	<th alt='Normal Ref Count' class='mutation-table-header'>Norm Ref</th>
	<th alt='Normal Alt Count' class='mutation-table-header'>Norm Alt</th>
	<th alt='Link to BAM file' class='mutation-table-header'>BAM</th>
	<th alt='Total number of<br> nonsynonymous mutations<br> in the sample'
	    class='mutation-table-header'>#Mut in Sample</th>
</script>

<script type="text/template" id="mutation_details_cosmic_tip_template">
	<div class='cosmic-details-tip-info'>
		<b>{{cosmicTotal}} occurrences of {{mutationKeyword}} mutations in COSMIC</b>
	</div>
	<table class='cosmic-details-table display'
	       cellpadding='0' cellspacing='0' border='0'>
		<thead>
			<tr>
				<th>COSMIC ID</th>
				<th>Protein Change</th>
				<th>Count</th>
			</tr>
		</thead>
		<tbody>{{cosmicDataRows}}</tbody>
	</table>
</script>

<script type="text/template" id="mutation_details_lollipop_tip_template">
	<span class='diagram-lollipop-tip'>
		<b>{{count}} {{mutationStr}}</b>
		<br/>AA Change: {{label}}
	</span>
</script>

<script type="text/template" id="mutation_details_region_tip_template">
	<span class="diagram-region-tip">
		{{identifier}} {{type}}, {{description}} ({{start}} - {{end}})
	</span>
</script>

<script type="text/template" id="mutation_details_fis_tip_template">
	Predicted impact score: <b>{{impact}}</b>
	<div class='mutation-assessor-link'>
		<a href='{{linkOut}}' target='_blank'>
			<img height=15 width=19 src='images/ma.png'>
			Go to Mutation Assessor
		</a>
	</div>
</script>

<script type="text/javascript">

	/**
	 * Default mutation view for a single gene.
	 *
	 * options: {el: [target container],
	 *           model: {geneSymbol: [hugo gene symbol],
	 *                   mutationSummary: [single line summary text],
	 *                   uniprotId: [gene identifier]}
	 *          }
	 */
	var MainMutationView = Backbone.View.extend({
		render: function() {
			// pass variables in using Underscore.js template
			var variables = { geneSymbol: this.model.geneSymbol,
				mutationSummary: this.model.mutationSummary,
				uniprotId: this.model.uniprotId};

			// compile the template using underscore
			var template = _.template(
				$("#mutation_view_template").html(),
				variables);

			// load the compiled HTML into the Backbone "el"
			this.$el.html(template);

			// format after rendering
			this.format();
		},
		format: function() {
			var self = this;

			// hide the mutation diagram filter info text by default
			self.hideFilterInfo();
			// hide the toolbar by default
			self.$el.find(".mutation-diagram-toolbar").hide();
		},
		/**
		 * Initializes the toolbar over the mutation diagram.
		 *
		 * @param diagram       the mutation diagram instance
		 * @param geneSymbol    gene symbol as a string
		 */
		initToolbar: function(diagram, geneSymbol) {
			var self = this;

			var toolbar = self.$el.find(".mutation-diagram-toolbar");
			var pdfButton = self.$el.find(".diagram-to-pdf");
			var svgButton = self.$el.find(".diagram-to-svg");

			// helper function to trigger submit event for the svg and pdf button clicks
			var submitForm = function(alterFn, diagram, formClass)
			{
				// alter diagram to have the desired output
				alterFn(diagram, false);

				// convert svg content to string
				var xmlSerializer = new XMLSerializer();
				var svgString = xmlSerializer.serializeToString(diagram.svg[0][0]);

				// restore previous settings after generating xml string
				alterFn(diagram, true);

				// set actual value of the form element (svgelement)
				var form = self.$el.find("." + formClass);
				form.find('input[name="svgelement"]').val(svgString);

				// submit form
				form.submit();
			};

			// helper function to adjust SVG for file output
			var alterDiagramForSvg = function(diagram, rollback)
			{
				var topLabel = geneSymbol;

				if (rollback)
				{
					topLabel = "";
				}

				// adding a top left label (to include a label in the file)
				diagram.updateTopLabel(topLabel);
			};

			// helper function to adjust SVG for PDF output
			var alterDiagramForPdf = function(diagram, rollback)
			{
				// we also need the same changes (top label) in pdf
				alterDiagramForSvg(diagram, rollback);

				cbio.util.alterAxesAttrForPDFConverter(
						diagram.svg.select(".mut-dia-x-axis"), 8,
						diagram.svg.select(".mut-dia-y-axis"), 3,
						rollback);
			};

			//add listener to the svg button
			svgButton.click(function (event) {
				// submit svg form
				submitForm(alterDiagramForSvg, diagram, "svg-to-file-form");
			});

			// add listener to the pdf button
			pdfButton.click(function (event) {
				// submit pdf form
				submitForm(alterDiagramForPdf, diagram, "svg-to-pdf-form");
			});

			toolbar.show();
		},
		/**
		 * Initializes the filter reset link, which is a part of filter info
		 * text on top of the diagram.
		 *
		 * @param diagram   mutation diagram instance
		 * @param tableView [optional] mutation table view instance
		 */
		initResetFilterInfo: function(diagram, tableView) {
			var self = this;
			var resetLink = self.$el.find(".mutation-details-filter-reset");

			// add listener to diagram reset link
			resetLink.click(function (event) {
				// reset the diagram contents
				diagram.resetPlot();
				// also reset the table filters (if provided)
				if (tableView)
				{
					// reset all previous table filters
					tableView.resetFilters();
				}
				// hide the filter info text
				self.hideFilterInfo();
			});
		},
		showFilterInfo: function() {
			this.$el.find(".mutation-details-filter-info").show();
		},
		hideFilterInfo: function() {
			this.$el.find(".mutation-details-filter-info").hide();
		}
	});

	/**
	 * Default mutation details view for the entire mutation details tab.
	 * Creates a separate MainMutationView (another Backbone view) for each gene.
	 *
	 * TODO support passing only gene symbols (in that case mutation data will be retrieved
	 * on demand -- upon clicking on the corresponding gene tab)
	 *
	 * options: {el: [target container],
	 *           model: {mutations: [mutation data as an array of JSON objects],
	 *                   sampleArray: [list of case ids as an array of strings],
	 *                   diagramOpts: [mutation diagram options -- optional]}
	 *           mut3dVis: [optional] reference to the 3d structure visualizer
	 *          }
	 */
	var MutationDetailsView = Backbone.View.extend({
		render: function() {
			var self = this;

			// init mutation utility
			self.util = new MutationDetailsUtil(
					new MutationCollection(self.model.mutations));

			// init tab view flags (for each gene)
			self.geneTabView = {};

			var content = self._generateContent();

			// TODO make the image customizable?
			var variables = {loaderImage: "images/ajax-loader.gif",
				listContent: content.listContent,
				mainContent: content.mainContent};

			// compile the template using underscore
			var template = _.template(
				$("#default_mutation_details_template").html(),
				variables);

			// load the compiled HTML into the Backbone "el"
			self.$el.html(template);

			if (self.model.mutations.length > 0)
			{
				self._initDefaultView(self.model.sampleArray,
					self.model.diagramOpts);
			}

			// format after render
			self.format();
		},
		/**
		 * Formats the contents of the view after the initial rendering.
		 */
		format: function()
		{
			var self = this;
			var container3d = self.$el.find("#mutation_3d_container");

			// hide loader image
			self.$el.find("#mutation_details_loader").hide();

			if (self.model.mutations.length > 0)
			{
				var mainContent = self.$el.find("#mutation_details_content");
				mainContent.tabs();
				mainContent.tabs('paging', {tabsPerPage: 10, follow: true});
				self.$el.find(".mutation-details-tabs-ref").tipTip(
					{defaultPosition: "bottom", delay:"100", edgeOffset: 10, maxWidth: 200});
			}

			// init 3D view if the visualizer is available
			if (self.options.mut3dVis)
			{
				var mutation3dVisView = new Mutation3dVisView(
						{el: container3d,
						parentEl: self.$el,
						mut3dVis: self.options.mut3dVis});

				mutation3dVisView.render();

				// update reference to the 3d vis view
				self.mut3dVisView = mutation3dVisView;
			}
			// if no visualizer, hide the 3D vis container
			else
			{
			   $(container3d).hide();
			}
		},
		/**
		 * Generates the content structure by creating div elements for each
		 * gene.
		 *
		 * @return {Object} content backbone with div elements for each gene
		 */
		_generateContent: function()
		{
			var self = this;
			var mainContent = "";
			var listContent = "";

			// check if there is mutation data
			if (self.model.mutations.length == 0)
			{
				// display information if no data is available
				mainContent = _.template($("#default_mutation_details_info_template").html(), {});
			}
			else
			{
				// create a div for for each gene
				for (var key in self.util.getMutationGeneMap())
				{
					mainContent += _.template(
						$("#default_mutation_details_main_content_template").html(),
							{loaderImage: "images/ajax-loader.gif",
							geneSymbol: key});

					listContent += _.template(
						$("#default_mutation_details_list_content_template").html(),
						{geneSymbol: key});
				}
			}

			return {mainContent: mainContent,
				listContent: listContent};
		},
		/**
		 * Initializes the mutation view for the current mutation data.
		 * Use this function if you want to have a default view of mutation
		 * details composed of different backbone views (by default params).
		 *
		 * If you want to have more customized components, it is better
		 * to initialize all the component separately.
		 *
		 * @param cases         array of case ids (samples)
		 * @param diagramOpts   [optional] mutation diagram options
		 */
		_initDefaultView: function(cases, diagramOpts)
		{
			var self = this;

			// TODO we need to use self.model.genes instead
			// ...if we would like to retrieve mutation data upon tab click

			var genes = [];

			// collect gene symbols for the current mutations
			for (var key in self.util.getMutationGeneMap())
			{
				genes.push(key);
			}

			// init view for the first gene only
			self._initView(genes[0], cases, diagramOpts);
			self.geneTabView[genes[0]] = true;

			// init other views upon click on the corresponding tab
			_.each(genes, function(gene, idx) {
				// do not initialize the view until the tab is clicked
				$("#mutation_details_tab_" + gene).click(function(evt) {
					// init view for the selected tab (if not initialized before)
					if (self.geneTabView[gene] == undefined)
					{
						self._initView(gene, cases, diagramOpts);
						self.geneTabView[gene] = true;
					}
				});
			});
		},
	    /**
		 * Initializes mutation view for the given gene and cases.
		 *
		 * @param gene          hugo gene symbol
	     * @param cases         array of case ids (samples)
	     * @param diagramOpts   [optional] mutation diagram options
		 */
		_initView: function(gene, cases, diagramOpts)
		{
			var self = this;
			var mutationMap = self.util.getMutationGeneMap();
			var mutationDiagram = null;
			var mainMutationView = null;

			/**
			 * Updates the mutation diagram after each change in the mutation table.
			 * This maintains synchronizing between the table and the diagram.
			 *
			 * @param tableSelector selector for the mutation table
			 */
			var updateMutationDiagram = function(tableSelector)
			{
				var mutationMap = self.util.getMutationIdMap();
				var currentMutations = [];

				// add current mutations into an array
				var rows = tableSelector.find("tr");
				_.each(rows, function(element, index) {
					var mutationId = $(element).attr("id");

					if (mutationId)
					{
						var mutation = mutationMap[mutationId];

						if (mutation)
						{
							currentMutations.push(mutation);
						}
					}
				});

				// update mutation diagram with the current mutations
				if (mutationDiagram !== null)
				{
					var mutationData = new MutationCollection(currentMutations);
					mutationDiagram.updatePlot(mutationData);

					if (mutationDiagram.isFiltered())
					{
						// display info text
						mainMutationView.showFilterInfo();
					}
					else
					{
						// hide info text
						mainMutationView.hideFilterInfo();
					}
				}
			};

			/**
			 * Add listeners to the diagram plot elements.
			 *
			 * @param diagram   mutation diagram
			 * @param tableView mutation table view
			 */
			var addPlotListeners = function(diagram, tableView)
			{
				diagram.addListener("circle", "mouseout", function() {
					// remove all highlights
					tableView.clearHighlights();
				});

				diagram.addListener("circle", "mouseover", function(datum, index) {
					// highlight mutations for the provided mutations
					tableView.highlight(datum.mutations);
				});

				diagram.addListener("circle", "click", function(datum, index) {
					// just ignore the action if the diagram is already in a graphical transition.
					// this is to prevent inconsistency due to fast clicks on the diagram.
					if (diagram.isInTransition())
					{
						return;
					}

					// if already highlighted, remove highlight on a second click
					if (diagram.isHighlighted(this))
					{
						// remove highlight for the target circle
						diagram.removeHighlight(this);

						// remove all table highlights
						tableView.clearHighlights();

						// roll back the table to its previous state
						// (to the last state when a manual filtering applied)
						tableView.rollBack();

						// hide filter reset info
						if (!diagram.isFiltered())
						{
							mainMutationView.hideFilterInfo();
						}
					}
					else
					{
						// remove all table & diagram highlights
						diagram.clearHighlights('circle');
						tableView.clearHighlights();

						// highlight the target circle on the diagram
						diagram.highlight(this);

						// filter table for the given mutations
						tableView.filter(datum.mutations);

						// show filter reset info
						mainMutationView.showFilterInfo();
					}
				});

				// add listener to the diagram background to remove highlights
				diagram.addListener(".background", "click", function(datum, index) {
					// just ignore the action if the diagram is already in a graphical transition.
					// this is to prevent inconsistency due to fast clicks on the diagram.
					if (diagram.isInTransition())
					{
						return;
					}

					// check if there is a highlighted circle
					// no action required if no circle is highlighted
					if (!diagram.isHighlighted())
					{
						return;
					}

					// remove all diagram highligts
					diagram.clearHighlights('circle');

					// remove all table highlights
					tableView.clearHighlights();

					// roll back the table to its previous state
					// (to the last state when a manual filtering applied)
					tableView.rollBack();

					// hide filter reset info
					if (!diagram.isFiltered())
					{
						mainMutationView.hideFilterInfo();
					}
				});
			};

			// callback function to init view after retrieving
			// sequence information.
			var init = function(sequenceData, pdbData)
			{
				// TODO sequenceData may be null for unknown genes...
				// get the first sequence from the response
				var sequence = sequenceData[0];
				// calculate somatic & germline mutation rates
				var mutationCount = self.util.countMutations(gene, cases);
				// generate summary string for the calculated mutation count values
				var summary = self.util.generateSummary(mutationCount);

				// prepare data for mutation view
				var model = {geneSymbol: gene,
					mutationSummary: summary,
					uniprotId: sequence.metadata.identifier};

				// reset the loader image
				self.$el.find("#mutation_details_loader").empty();

				// init the main view
				var mainView = new MainMutationView({
					el: "#mutation_details_" + gene,
					model: model});

				mainView.render();

				// update the reference after rendering the view
				mainMutationView = mainView;

				// draw mutation diagram
				var diagram = self._drawMutationDiagram(
						gene, mutationMap[gene], sequence, diagramOpts);

				// check if diagram is initialized successfully.
				if (diagram)
				{
					// init diagram toolbar
					mainView.initToolbar(diagram, gene);

					if (self.mut3dVisView &&
						pdbData)
					{
						// collection of pdb model instances
						var pdbColl = self.util.processPdbData(gene, pdbData);

						// init the 3d view
						var view3d = new Mutation3dView({
							el: "#mutation_3d_" + gene,
							model: {pdbColl: pdbColl, geneSymbol: gene},
							mut3dVisView: self.mut3dVisView,
							diagram: diagram});

						view3d.render();
					}
				}
				else
				{
					console.log("Error initializing mutation diagram: %s", gene);
				}

				// draw mutation table

				var mutationTableView = new MutationDetailsTableView(
						{el: "#mutation_table_" + gene,
						model: {geneSymbol: gene,
							mutations: mutationMap[gene],
							syncFn: updateMutationDiagram}});

				mutationTableView.render();

				// update reference after rendering the table
				mutationDiagram = diagram;

				// add default event listeners for the diagram
				addPlotListeners(diagram, mutationTableView);

				// init reset info text content for the diagram
				mainView.initResetFilterInfo(diagram, mutationTableView);
			};

			// Gets the pdb data from the server by using the uniprot identifier
			// within the given sequence data, and then initializes the view
			var getPdbData = function(sequenceData)
			{
				// TODO sequenceData may be null for unknown genes...
				// get the first sequence from the response
				var sequence = sequenceData[0];

				// get protein positions for current mutations
				var positions = self.util.getProteinPositions(gene);

				var positionData = [];

				_.each(positions, function(ele, i) {
					if (ele.start > -1)
					{
						positionData.push(ele.start);
					}

					if (ele.end > ele.start)
					{
						positionData.push(ele.end);
					}
				});

				// get pdb data for the current mutations
				$.getJSON("get3dPdb.json",
					{uniprotId: sequence.metadata.identifier,
					positions: positionData.join(" ")},
					function(pdbData) {
						// init view with the sequence and pdb data
						init(sequenceData, pdbData);
				});
			};

			// get sequence data & pdb data for the current gene & init view
			if (self.options.mut3dVis)
			{
				$.getJSON("getPfamSequence.json", {geneSymbol: gene}, getPdbData);
			}
			else
			{
				// if no 3D visualizer is available, just skip pdb data retrieval
				$.getJSON("getPfamSequence.json", {geneSymbol: gene}, init);
			}
		},
		/**
		 * Initializes the mutation diagram view.
		 *
		 * @param gene          hugo gene symbol
		 * @param mutationData  mutation data (array of JSON objects)
		 * @param sequenceData  sequence data (as a JSON object)
		 * @param options       [optional] diagram options
		 */
		_drawMutationDiagram: function(gene, mutationData, sequenceData, options)
		{
			// use defaults if no options provided
			if (!options)
			{
				options = {};
			}

			// do not draw the diagram if there is a critical error with
			// the sequence data
			if (sequenceData["length"] == "" ||
			    parseInt(sequenceData["length"]) <= 0)
			{
				// return null to indicate an error
				return null;
			}

			// overwrite container in any case (for consistency with the default view)
			options.el = "#mutation_diagram_" + gene.toUpperCase();

			// create a backbone collection for the given data
			var mutationColl = new MutationCollection(mutationData);

			var mutationDiagram = new MutationDiagram(gene, options, mutationColl);
			mutationDiagram.initDiagram(sequenceData);

			return mutationDiagram;
		}
	});

	/**
	 * 3D visualizer controls view.
	 *
	 * This view is designed to provide controls to initialize, show or hide
	 * the actual 3D visualizer panel. PDB chain panel, which is supposed to
	 * be displayed just below the mutation diagram, is initialized by this view.
	 *
	 * IMPORTANT NOTE: This view does not initialize the actual 3D visualizer.
	 * 3D visualizer is a global instance bound to MainMutationView
	 * and it is maintained by Mutation3dVisView.
	 *
	 * options: {el: [target container],
	 *           model: {geneSymbol: hugo gene symbol,
	 *                   pdbColl: collection of PdbModel instances},
	 *           mut3dVisView: [optional] reference to the Mutation3dVisView instance,
	 *           diagram: [optional] reference to the MutationDiagram instance
	 *          }
	 */
	var Mutation3dView = Backbone.View.extend({
		render: function()
		{
			var self = this;
			var gene = self.model.geneSymbol;

			// compile the template using underscore
			var template = _.template(
					$("#mutation_3d_view_template").html(), {});

			// load the compiled HTML into the Backbone "el"
			this.$el.html(template);

			// init pdb panel view
			var panelOpts = {el: "#mutation_pdb_panel_view_" + gene.toUpperCase(),
				model: self.model,
				mut3dVisView: self.options.mut3dVisView,
				diagram: self.options.diagram};

			var pdbPanelView = new PdbPanelView(panelOpts);
			pdbPanelView.render();
			self.pdbPanelView = pdbPanelView;

			// format after rendering
			this.format();
		},
		format: function()
		{
			var self = this;

			// add click listener for the 3d visualizer initializer
			self.$el.find(".mutation-3d-vis").click(function() {
				var vis = self.options.mut3dVisView;
				var panel = self.pdbPanelView;
				var pdbColl = self.model.pdbColl;

				if (vis != null &&
				    panel != null &&
				    pdbColl.length > 0)
				{
					// reload the visualizer content with the default pdb and chain
					var pdbId = pdbColl.at(0).pdbId;
					var chain = pdbColl.at(0).chains.at(0);

					panel.showView();
					vis.updateView(pdbId, chain);
				}
			});
		}
	});

	/**
	 * PDB Panel View.
	 *
	 * This view is designed to function in parallel with the 3D visualizer.
	 *
	 * options: {el: [target container],
	 *           model: {geneSymbol: hugo gene symbol,
	 *                   pdbColl: collection of PdbModel instances},
	 *           mut3dVisView: [optional] reference to the Mutation3dVisView instance,
	 *           diagram: [optional] reference to the MutationDiagram instance
	 *          }
	 */
	var PdbPanelView = Backbone.View.extend({
		render: function()
		{
			var self = this;

			// compile the template using underscore
			var template = _.template(
					$("#pdb_panel_view_template").html(),
					{geneSymbol: self.model.geneSymbol});

			// load the compiled HTML into the Backbone "el"
			self.$el.html(template);

			// init pdb panel
			self.pdbPanel = self._initPdbPanel();

			// format after rendering
			self.format();
		},
		format: function()
		{
			var self = this;

			// hide view initially
			self.hideView();

			// format panel controls

			var expandButton = self.$el.find(".expand-collapse-pdb-panel");

			expandButton.button({
				icons: {primary: "ui-icon-triangle-2-n-s"},
				text: false});
			expandButton.css({width: "300px", height: "12px"});

			expandButton.click(function() {
				self.pdbPanel.toggleHeight();
			});
		},
		hideView: function()
		{
			var self = this;
			self.$el.hide();
		},
		showView: function()
		{
			var self = this;
			self.$el.show();
		},
		/**
		 * Initializes the PDB chain panel.
		 *
		 * @return {MutationPdbPanel}   panel instance
		 */
		_initPdbPanel: function()
		{
			var self = this;
			var panel = null;

			var gene = self.model.geneSymbol;
			var pdbColl = self.model.pdbColl;
			var mutationDiagram = self.options.diagram;
			var vis = self.options.mut3dVisView;

			if (mutationDiagram != null)
			{
				var xScale = mutationDiagram.xScale;

				var options = {el: "#mutation_pdb_panel_" + gene.toUpperCase(),
					marginLeft: mutationDiagram.options.marginLeft,
					marginRight: mutationDiagram.options.marginRight};

				// init panel
				panel = new MutationPdbPanel(options, pdbColl, xScale);
				panel.init();

				// add event listeners for chain selection
				if (vis != null)
				{
					panel.addListener("rect", "click", function(datum, index) {
						vis.updateView(datum.pdbId, datum.chain);
					});
				}
			}

			return panel;
		}
	});

	/**
	 * Actual 3D Visualizer view. This view is designed to contain the 3D
	 * structure visualizer app and its control buttons.
	 *
	 * options: {el: [target container],
	 *           parentEl: [parent container],
	 *           model: {geneSymbol: hugo gene symbol,
	 *                   pdbColl: collection of PdbModel instances},
	 *           mut3dVis: [optional] reference to the Mutation3dVis instance
	 *          }
	 */
	var Mutation3dVisView = Backbone.View.extend({
		render: function()
		{
			var self = this;

			// compile the template using underscore
			var template = _.template(
					$("#mutation_3d_vis_template").html(), {});

			// load the compiled HTML into the Backbone "el"
			this.$el.html(template);

			// format after rendering
			this.format();
		},
		format: function()
		{
			var self = this;
			var mut3dVis = self.options.mut3dVis;

			// initially hide the 3d visualizer container
			var container3d = self.$el;
			container3d.hide();

			// update the container of 3d visualizer
			if (mut3dVis != null)
			{
				mut3dVis.updateContainer(container3d);
			}

			// add click listener to the close icon of the 3d vis container
			self.$el.find(".mutation-3d-close").click(function() {
				// hide the vis pane
				if (mut3dVis != null)
				{
					mut3dVis.hide();
				}

				// also hide all pdb panel views
				self.options.parentEl.find(".mutation-pdb-panel-view").hide();
			});

			// format toolbar elements

			// spin toggle
			var spinChecker = self.$el.find(".mutation-3d-spin");

			spinChecker.change(function(){
				if (mut3dVis != null)
				{
					mut3dVis.toggleSpin();
				}
			});

			// style selection menu
			var styleMenu = self.$el.find(".mutation-3d-style-select");

			styleMenu.chosen({width: 120, disable_search: true});
			styleMenu.change(function(){
				var selected = $(this).val();

				if (mut3dVis != null)
				{
					mut3dVis.changeStyle(selected);
				}

			});

		},
		updateView: function(pdbId, chain)
		{
			var self = this;
			var mut3dVis = self.options.mut3dVis;

			// reload the selected pdb and chain data
			mut3dVis.show();
			mut3dVis.reload(pdbId, chain);

			// update info
			// TODO it might be better to do this with backbone's internal mvc listeners
			self.$el.find(".mutation-3d-pdb-id").text(pdbId);
			self.$el.find(".mutation-3d-chain-id").text(chain.chainId);
		}
	});

	/**
	 * Default table view for the mutations.
	 *
	 * options: {el: [target container],
	 *           model: {mutations: [mutation data as an array of JSON objects],
	 *                   geneSymbol: [hugo gene symbol as a string],
	 *                   syncFn: sync function for outside sources}
	 *          }
	 */
	var MutationDetailsTableView = Backbone.View.extend({
		render: function()
		{
			var self = this;

			var mutations = new MutationCollection(self.model.mutations);

			var tableHeaders = _.template(
					$("#mutation_details_table_header_row_template").html(), {});

			var tableRows = "";

			for (var i=0; i < mutations.length; i++)
			{
				var dataRowVariables = self._getDataRowVars(mutations.at(i));

				var tableDataTemplate = _.template(
						$("#mutation_details_table_data_row_template").html(),
						dataRowVariables);

				tableRows += tableDataTemplate;
			}

			var tableVariables = {geneSymbol: self.model.geneSymbol,
				tableHeaders: tableHeaders,
				tableRows: tableRows};

			// compile the table template
			var tableTemplate = _.template(
					$("#mutation_details_table_template").html(),
					tableVariables);

			// load the compiled HTML into the Backbone "el"
			self.$el.html(tableTemplate);

			self.format();
		},
		/**
		 * Formats the contents of the view after the initial rendering.
		 */
		format: function()
		{
			var self = this;

			// remove invalid links
			self.$el.find('a[href=""]').remove();
			self.$el.find('a[alt=""]').remove();

			// add click listener for each igv link to get the actual parameters
			// from another servlet
			_.each(self.$el.find('.igv-link'), function(element, index) {
				// TODO use mutation id, instead of binding url to attr alt
				var url = $(element).attr("alt");

				$(element).click(function(evt) {
					// get parameters from the server and call related igv function
					$.getJSON(url, function(data) {
						//console.log(data);
						// TODO this call displays warning message (resend)
						prepIGVLaunch(data.bamFileUrl, data.encodedLocus, data.referenceGenome, data.trackName);
					});
				});
			});

			var tableSelector = self.$el.find('.mutation_details_table');

			var tableUtil = new MutationTableUtil(tableSelector,
				self.model.geneSymbol,
				self.model.mutations);

			// add a callback function for sync purposes
			tableUtil.registerCallback(self.model.syncFn);

			// format the table (convert to a DataTable)
			tableUtil.formatTable();

			// save a reference to the util for future access
			self.tableUtil = tableUtil;
		},
		/**
		 * Highlights the given mutations in the table.
		 *
		 * @param mutations mutations to highlight
		 */
		highlight: function(mutations)
		{
			var self = this;
			var tableSelector = self.$el.find('.mutation_details_table');

			for (var i = 0; i < mutations.length; i++)
			{
				var row = tableSelector.find("#" + mutations[i].mutationId);
				row.addClass("mutation-table-highlight");
			}
		},
		/**
		 * Clears all highlights from the mutation table.
		 */
		clearHighlights: function()
		{
			var self = this;
			var tableSelector = self.$el.find('.mutation_details_table');

			// TODO this depends on highlight function
			tableSelector.find('tr').removeClass("mutation-table-highlight");
		},
		/**
		 * Filters out all other mutations than the given mutations.
		 *
		 * @param mutations mutations to keep
		 * @param updateBox [optional] show the filter text in the search box
		 * @param limit     [optional] column to limit filtering to
		 */
		filter: function(mutations, updateBox, limit)
		{
			var self = this;
			var oTable = self.tableUtil.getDataTable();

			// construct regex
			var ids = [];

			for (var i = 0; i < mutations.length; i++)
			{
				ids.push(mutations[i].mutationId);
			}

			var regex = "(" + ids.join("|") + ")";
			var asRegex = true;

			// empty mutation list, just show everything
			if (ids.length == 0)
			{
				regex = "";
				asRegex = false;
			}

			// disable callbacks before filtering, otherwise it creates a chain reaction
			self.tableUtil.setCallbackActive(false);

			// apply filter
			self._applyFilter(oTable, regex, asRegex, updateBox, limit);

			// enable callbacks after filtering
			self.tableUtil.setCallbackActive(true);
		},
		/**
		 * Resets all table filters (rolls back to initial state)
		 */
		resetFilters: function()
		{
			var self = this;
			// pass an empty array to show everything
			self.filter([], true);
			// also clean filter related variables
			self.tableUtil.cleanFilters();
		},
		/**
		 * Rolls back the table to the last state where a manual search
		 * (manual filtering) performed. This function is required since
		 * we also filter the table programmatically.
		 */
		rollBack: function()
		{
			var self = this;
			var oTable = self.tableUtil.getDataTable();

			// disable callbacks before filtering, otherwise it creates a chain reaction
			self.tableUtil.setCallbackActive(false);

			// re-apply last manual filter string
			var searchStr = self.tableUtil.getManualSearch();
			self._applyFilter(oTable, searchStr, false);

			// enable callbacks after filtering
			self.tableUtil.setCallbackActive(true);
		},
		/**
		 * Filters the given data table with the provided filter string.
		 *
		 * @param oTable    target data table to be filtered
		 * @param filterStr filter string to apply with the filter
		 * @param asRegex   indicates if the given filterStr is a regex or not
		 * @param updateBox [optional] show the filter text in the search box
		 * @param limit     [optional] column to limit filtering to
		 * @private
		 */
		_applyFilter: function(oTable, filterStr, asRegex, updateBox, limit)
		{
			if (limit == undefined)
			{
				limit = null;
			}

			// TODO not updating the filter text in the box may be confusing
			if (updateBox == undefined)
			{
				updateBox = false;
			}

			var smartFilter = true;
			var caseInsensitive = true;

			oTable.fnFilter(filterStr, limit, asRegex, smartFilter, updateBox, caseInsensitive);
		},
		/**
		 * Extract & generates data required to visualize a single row of the table.
		 * The data returned by this function can be used to compile a mutation data
		 * table row template.
		 *
		 * @param mutation  a MutationModel instance
		 * @return {object} template variables as a single object
		 * @private
		 */
		_getDataRowVars: function(mutation)
		{
			var self = this;

			/**
			 * Mapping between the mutation type (data) values and
			 * view values. The first element of an array corresponding to a
			 * data value is the display text (html), and the second one
			 * is style (css).
			 */
			var mutationTypeMap = {
				missense_mutation: {label: "Missense", style: "missense_mutation"},
				nonsense_mutation: {label: "Nonsense", style: "trunc_mutation"},
				nonstop_mutation: {label: "Nonstop", style: "trunc_mutation"},
				frame_shift_del: {label: "FS del", style: "trunc_mutation"},
				frame_shift_ins: {label: "FS ins", style: "trunc_mutation"},
				in_frame_ins: {label: "IF ins", style: "inframe_mutation"},
				in_frame_del: {label: "IF del", style: "inframe_mutation"},
				splice_site: {label: "Splice", style: "trunc_mutation"},
				other: {style: "other_mutation"}
			};

			/**
			 * Mapping between the validation status (data) values and
			 * view values. The first element of an array corresponding to a
			 * data value is the display text (html), and the second one
			 * is style (css).
			 */
			var validationStatusMap = {
				valid: {label: "V", style: "valid", tooltip: "Valid"},
				validated: {label: "V", style: "valid", tooltip: "Valid"},
				wildtype: {label: "W", style: "wildtype", tooltip: "Wildtype"},
				unknown: {label: "U", style: "unknown", tooltip: "Unknown"},
				not_tested: {label: "U", style: "unknown", tooltip: "Unknown"},
				none: {label: "U", style: "unknown", tooltip: "Unknown"},
				na: {label: "U", style: "unknown", tooltip: "Unknown"}
			};

			/**
			 * Mapping between the mutation status (data) values and
			 * view values. The first element of an array corresponding to a
			 * data value is the display text (html), and the second one
			 * is style (css).
			 */
			var mutationStatusMap = {
				somatic: {label: "S", style: "somatic", tooltip: "Somatic"},
				germline: {label: "G", style: "germline", tooltip: "Germline"},
				unknown: {label: "U", style: "unknown", tooltip: "Unknown"},
				none: {label: "U", style: "unknown", tooltip: "Unknown"},
				na: {label: "U", style: "unknown", tooltip: "Unknown"}
			};

			var omaScoreMap = {
				h: {label: "H", style: "oma_high", tooltip: "High"},
				m: {label: "M", style: "oma_medium", tooltip: "Medium"},
				l: {label: "L", style: "oma_low", tooltip: "Low"},
				n: {label: "N", style: "oma_neutral", tooltip: "Neutral"}
			};

			var vars = {};

			vars.mutationId = mutation.mutationId;
			vars.caseId = mutation.caseId;
			vars.linkToPatientView = mutation.linkToPatientView;

			var proteinChange = self._getProteinChange(mutation);
			vars.proteinChange = proteinChange.text;
			vars.proteinChangeClass = proteinChange.style;
			vars.proteinChangeTip = proteinChange.tip;

			var mutationType = self._getMutationType(mutationTypeMap, mutation.mutationType);
			vars.mutationTypeClass = mutationType.style;
			vars.mutationTypeText = mutationType.text;

			var cosmic = self._getCosmic(mutation.cosmicCount);
			vars.cosmicClass = cosmic.style;
			vars.cosmicCount = cosmic.count;

			var fis = self._getFis(omaScoreMap, mutation.functionalImpactScore, mutation.fisValue);
			vars.fisClass = fis.fisClass;
			vars.omaClass = fis.omaClass;
			vars.fisValue = fis.value;
			vars.fisText = fis.text;

			vars.xVarLink = mutation.xVarLink;
			vars.msaLink = mutation.msaLink;
			vars.pdbLink = mutation.pdbLink;
			vars.igvLink = mutation.igvLink;

			var mutationStatus = self._getMutationStatus(mutationStatusMap, mutation.mutationStatus);
			vars.mutationStatusTip = mutationStatus.tip;
			vars.mutationStatusClass = mutationStatus.style;
			vars.mutationStatusText = mutationStatus.text;

			var validationStatus = self._getValidationStatus(validationStatusMap, mutation.validationStatus);
			vars.validationStatusTip = validationStatus.tip;
			vars.validationStatusClass = validationStatus.style;
			vars.validationStatusText = validationStatus.text;

			vars.sequencingCenter = mutation.sequencingCenter;
			vars.chr = mutation.chr;

			var startPos = self._getIntValue(mutation.startPos);
			vars.startPos = startPos.text;
			vars.startPosClass = startPos.style;

			var endPos = self._getIntValue(mutation.endPos);
			vars.endPos = endPos.text;
			vars.endPosClass = endPos.style;

			vars.referenceAllele = mutation.referenceAllele;
			vars.variantAllele = mutation.variantAllele;

			var alleleCount = self._getAlleleCount(mutation.tumorAltCount);
			vars.tumorAltCount = alleleCount.text;
			vars.tumorAltCountClass = alleleCount.style;

			alleleCount = self._getAlleleCount(mutation.tumorRefCount);
			vars.tumorRefCount = alleleCount.text;
			vars.tumorRefCountClass = alleleCount.style;

			alleleCount = self._getAlleleCount(mutation.normalAltCount);
			vars.normalAltCount = alleleCount.text;
			vars.normalAltCountClass = alleleCount.style;

			alleleCount = self._getAlleleCount(mutation.normalRefCount);
			vars.normalRefCount = alleleCount.text;
			vars.normalRefCountClass = alleleCount.style;

			var tumorFreq = self._getAlleleFreq(mutation.tumorFreq,
					mutation.tumorAltCount,
					mutation.tumorRefCount,
					"simple-tip-left");
			vars.tumorFreq = tumorFreq.text;
			vars.tumorFreqClass = tumorFreq.style;
			vars.tumorFreqTipClass = tumorFreq.tipClass;
			vars.tumorTotalCount = tumorFreq.total;

			var normalFreq = self._getAlleleFreq(mutation.normalFreq,
					mutation.normalAltCount,
					mutation.normalRefCount,
					"simple-tip-left");
			vars.normalFreq = normalFreq.text;
			vars.normalFreqClass = normalFreq.style;
			vars.normalFreqTipClass = normalFreq.tipClass;
			vars.normalTotalCount = normalFreq.total;

			var mutationCount = self._getIntValue(mutation.mutationCount);
			vars.mutationCount = mutationCount.text;
			vars.mutationCountClass = mutationCount.style;

			return vars;
		},
        /**
         * Returns the text content and the css class for the given
         * mutation type value.
         *
         * @param map   map of <mutationType, {label, style}>
         * @param value actual string value of the mutation type
         * @return {{style: string, text: string}}
         * @private
         */
		_getMutationType: function(map, value)
		{
			var style, text;
			value = value.toLowerCase();

			if (map[value] != null)
			{
				style = map[value].style;
				text = map[value].label;
			}
			else
			{
				style = map.other.style;
				text = value;
			}

			return {style: style, text: text};
		},
		/**
         * Returns the text content, the css class, and the tooltip
		 * for the given mutation type value.
         *
         * @param map   map of <mutationStatus, {label, style, tooltip}>
         * @param value actual string value of the mutation status
         * @return {{style: string, text: string, tip: string}}
         * @private
         */
		_getMutationStatus: function(map, value)
		{
			var style = "simple-tip";
			var text = value;
			var tip = "";
			value = value.toLowerCase();

			if (map[value] != null)
			{
				style = map[value].style;
				text = map[value].label;
				tip = map[value].tooltip;
			}

			return {style: style, tip: tip, text: text};
		},
		/**
		 * Returns the text content, the css class, and the tooltip
		 * for the given validation status value.
		 *
		 * @param map   map of <validationStatus, {label, style, tooltip}>
		 * @param value actual string value of the validation status
		 * @return {{style: string, text: string, tip: string}}
		 * @private
		 */
		_getValidationStatus: function(map, value)
		{
			var style, label, tip;
			value = value.toLowerCase();

			if (map[value] != null)
			{
				style = map[value].style;
				label = map[value].label;
				tip = map[value].tooltip;
			}
			else
			{
				style = map.unknown.style;
				label = map.unknown.label;
				tip = map.unknown.tooltip;
			}

			return {style: style, tip: tip, text: label};
		},
		/**
		 * Returns the text content, the css classes, and the tooltip
		 * for the given string and numerical values of a
		 * functional impact score.
		 *
		 * @param map       map of <FIS, {label, style, tooltip}>
		 * @param fis       string value of the functional impact (h, l, m or n)
		 * @param fisValue  numerical value of the functional impact score
		 * @return {{fisClass: string, omaClass: string, value: string, text: string}}
		 * @private
		 */
		_getFis: function(map, fis, fisValue)
		{
			var text = "";
			var fisClass = "";
			var omaClass = "";
			var value = "";
			fis = fis.toLowerCase();

			if (map[fis] != null)
			{
				value = map[fis].tooltip;

				if (fisValue != null)
				{
					value = fisValue.toFixed(2);
				}

				text = map[fis].label;
				fisClass = map[fis].style;
				omaClass = "oma_link";
			}

			return {fisClass: fisClass, omaClass: omaClass, value: value, text: text};
		},
		/**
		 * Returns the text content, the css classes, and the total
		 * allele count for the given allele frequency.
		 *
		 * @param frequency allele frequency
		 * @param alt       alt allele count
		 * @param ref       ref allele count
		 * @param tipClass  css class for the tooltip
		 * @return {{text: string, total: number, style: string, tipClass: string}}
		 * @private
		 */
		_getAlleleFreq: function(frequency, alt, ref, tipClass)
		{
			var text = "NA";
			var total = alt + ref;
			var style = "";
			var tipStyle = "";

			if (frequency)
			{
				style = "mutation_table_allele_freq";
				text = frequency.toFixed(2);
				tipStyle = tipClass;
			}

			return {text: text, total: total, style: style, tipClass: tipStyle};
		},
		_getProteinChange: function(mutation)
		{
			var style = "protein_change";
			var tip = "";

			// TODO disabled temporarily, enable when isoform support completely ready
//        if (!mutation.canonicalTranscript)
//        {
//            style = "best_effect_transcript " + style;
//            // TODO find a better way to display isoform information
//            tip = "Specified protein change is for the best effect transcript " +
//                "instead of the canonical transcript.<br>" +
//                "<br>RefSeq mRNA id: " + "<b>" + mutation.refseqMrnaId + "</b>" +
//                "<br>Codon change: " + "<b>" + mutation.codonChange + "</b>" +
//                "<br>Uniprot id: " + "<b>" + mutation.uniprotId + "</b>";
//        }

			return {text: mutation.proteinChange,
				style : style,
				tip: tip};
		},
		/**
		 * Returns the css class and text for the given cosmic count.
		 *
		 * @param count number of occurrences
		 * @return {{style: string, count: string}}
		 * @private
		 */
		_getCosmic: function(value, count)
		{
			var style = "";
			var text = "";

			if (count > 0)
			{
				style = "mutation_table_cosmic";
				text = count;
			}

			return {style: style,
				count: text};
	    },
		/**
		 * Returns the text and css class values for the given integer value.
		 *
		 * @param value an integer value
		 * @return {{text: *, style: string}}
		 * @private
		 */
		_getIntValue: function(value)
		{
			var text = value;
			var style = "mutation_table_int_value";

			if (value == null)
			{
				text = "NA";
				style = "";
			}

			return {text: text, style: style};
		},
		/**
		 * Returns the text and css class values for the given allele count value.
		 *
		 * @param count an integer value
		 * @return {{text: *, style: string}}
		 * @private
		 */
		_getAlleleCount: function(count)
		{
			var text = count;
			var style = "mutation_table_allele_count";

			if (count == null)
			{
				text = "NA";
				style = "";
			}

			return {text: text, style: style};
	    }
	});

	/**
	 * Tooltip view for the mutation table's cosmic column.
	 *
	 * options: {el: [target container],
	 *           model: {cosmic: [raw cosmic text],
	 *                   geneSymbol: [hugo gene symbol],
	 *                   keyword: [mutation keyword],
	 *                   total: [number of total cosmic occurrences]}
	 *          }
	 */
	var CosmicTipView = Backbone.View.extend({
		render: function()
		{
			// compile the template
			var template = this.compileTemplate();

			// load the compiled HTML into the Backbone "el"
			this.$el.html(template);
			this.format();
		},
		format: function()
		{
			// initialize cosmic details table
			this.$el.find(".cosmic-details-table").dataTable({
				"aaSorting" : [[2, "desc"]], // sort by count at init
				"sDom": 'pt', // show the table and the pagination buttons
				"aoColumnDefs": [
                                    { "mRender": function ( data, type, full ) {
                                            return '<a href="http://cancer.sanger.ac.uk/cosmic/mutation/overview?id='+data+'">'+data+'</a>';
                                       },
                                       "aTargets": [0]},
                                    { "sType": "aa-change-col", "sClass": "left-align-td", "aTargets": [1]},
                                    { "sType": "numeric", "sClass": "left-align-td", "aTargets": [2]}],
				"bDestroy": false,
				"bPaginate": true,
				"bJQueryUI": true,
				"bFilter": false});
		},
		_parseCosmic: function(cosmic)
		{
			var dataRows = [];
			// TODO create a backbone template for the cosmic table row
			// COSMIC data (as AA change & frequency pairs)
			cosmic.forEach(function(c) {
                            dataRows.push(c[0]+"</td><td>"+c[1]+"</td><td>"+c[2]);
                        });

			return "<tr><td>" + dataRows.join("</td></tr><tr><td>") + "</td></tr>";
		},
		compileTemplate: function()
		{
			var dataRows = this._parseCosmic(this.model.cosmic);

			// pass variables in using Underscore.js template
			var variables = {cosmicDataRows: dataRows,
				cosmicTotal: this.model.total,
				mutationKeyword: this.model.keyword};

			// compile the template using underscore
			return _.template(
					$("#mutation_details_cosmic_tip_template").html(),
					variables);
		}
	});

	/**
	 * Tooltip view for the mutation diagram's lollipop circles.
	 *
	 * options: {el: [target container],
	 *           model: {count: [number of mutations],
	 *                   label: [info for that location]}
	 *          }
	 */
	var LollipopTipView = Backbone.View.extend({
		render: function()
		{
			// compile the template
			var template = this.compileTemplate();

			// load the compiled HTML into the Backbone "el"
			this.$el.html(template);
			this.format();
		},
		format: function()
		{
			// implement if necessary...
		},
		compileTemplate: function()
		{
			var mutationStr = this.model.count > 1 ? "mutations" : "mutation";

			// pass variables in using Underscore.js template
			var variables = {count: this.model.count,
				mutationStr: mutationStr,
				label: this.model.label};

			// compile the template using underscore
			return _.template(
					$("#mutation_details_lollipop_tip_template").html(),
					variables);
		}
	});

	/**
	 * Tooltip view for the mutation diagram's region rectangles.
	 *
	 * options: {el: [target container],
	 *           model: {identifier: [region identifier],
	 *                   type: [region type],
	 *                   description: [region description],
	 *                   start: [start position],
	 *                   end: [end position]}
	 *          }
	 */
	var RegionTipView = Backbone.View.extend({
		render: function()
		{
			// compile the template
			var template = this.compileTemplate();

			// load the compiled HTML into the Backbone "el"
			this.$el.html(template);
			this.format();
		},
		format: function()
		{
			// implement if necessary...
		},
		compileTemplate: function()
		{
			// pass variables in using Underscore.js template
			var variables = {identifier: this.model.identifier,
				type: this.model.type.toLowerCase(),
				description: this.model.description,
				start: this.model.start,
				end: this.model.end};

			// compile the template using underscore
			return _.template(
					$("#mutation_details_region_tip_template").html(),
					variables);
		}
	});

	/**
	 * Tooltip view for the mutation table's FIS column.
	 *
	 * options: {el: [target container],
	 *           model: {xvia: [link to Mutation Assessor],
	 *                   impact: [impact text or value]}
	 *          }
	 */
	var PredictedImpactTipView = Backbone.View.extend({
		render: function()
		{
			// compile the template
			var template = this.compileTemplate();

			// load the compiled HTML into the Backbone "el"
			this.$el.html(template);
			this.format();
		},
		format: function()
		{
			var xvia = this.model.xvia;

			if (xvia == null || xvia == "NA")
			{
				this.$el.find(".mutation-assessor-link").hide();
			}
		},
		compileTemplate: function()
		{
			// pass variables in using Underscore.js template
			var variables = {linkOut: this.model.xvia,
				impact: this.model.impact};

			// compile the template using underscore
			return _.template(
					$("#mutation_details_fis_tip_template").html(),
					variables);
		}
	});

</script>